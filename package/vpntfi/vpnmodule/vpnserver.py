from lib import vpnL2tp
from lib import ppp
from lib import ipsec
from lib import radius
import os


STATUS_FAILED = 1001
CANT_GET_LDAPCONFIG = 1002
DISABLE_ROUTING_FAIL = 1003

CMD_DISABLE_ROUTING = "iptables -t nat -D POSTROUTING -s %s/24 -j MASQUERADE"

def decor_vpn(func):
    def wrap_func(self):
        ret = self.interface.getConfig(self.paras, "getter")
        self.config2paras(ret['data'])
        return func(self)
    return wrap_func

class VPNFace:
    def __init__(self):
        pass

    def log(self):
        pass

class VPNServer:
    def __init__(self, **paras):
        reload(vpnL2tp)
        reload(ppp)
        reload(radius)
        self.interface = paras['interface']
        self.vpnobj = vpnL2tp.VPNL2TP()
        self.pppobj = ppp.PPP()
        self.radiusobj = radius.RADIUS()
        self.ipsecobj = ipsec.IPSec()
        self.debug = False
   
    def enable_debug(self):
        self.debug = True
        return {'status' : 0}

    def disable_debug(self):
        self.debug = False
        return {'status' : 0}

    def log(self, msg):
        if self.debug == True:
            self.interface.log("[VPNServer:] " + msg)

    @decor_vpn
    def xl2tpd_start(self):
        self.vpnobj.start()
        self.radiusobj.start()
        self.enable_postrouting()
        return self.interface.saveConfig({'proto':'xl2tpd', 'enabled' : "True"}, "write")

    @decor_vpn
    def xl2tpd_stop(self):
        self.vpnobj.stop()
        self.radiusobj.stop()
        ret = self.disable_postrouting()
        if ret['status'] != 0:
            return ret
        return self.interface.saveConfig({'proto': 'xl2tpd', 'enabled' : "False"}, "write")

    def xl2tpd_restart(self):
        self.xl2tpd_stop()
        self.xl2tpd_start()
        return {'status' : 0}

    def xl2tpd_status(self):
        ret = []
        ret.append(self.vpnobj.status())
        ret.append(self.ipsecobj.status())
        ret.append(self.radiusobj.status())
        if ret[0] == "active" and ret[1] == "active" and ret[2] == "active":
            return {'status': 0, 'data' : {"status" : True} }
        else:
            return {'status': 0, 'data' : {"status" : False} }
            
    def xl2tpd_view(self):
        data = self.vpnobj.view()
        return {'status' : 0, 'data' : data}

    def xl2tpd_cut(self):
        for vpnip in self.paras['vpnip']:
            ret = self.vpnobj.cut(vpnip)
        return {'status' : 0}

    def xl2tpd_config(self):
        return self.interface.getConfig(self.paras, "getter")

    def ntlm_create_localusers(self):
        ret = self.interface.getLocalUsers(self.paras)
        return self.radiusobj.ntlm_create_localusers(ret['data'])

    def xl2tpd_options_mschap(self):
        self.vpnobj.setLocalip(self.paras['ip_pool'], self.paras['max_conns'])
        self.vpnobj.enableMSCHAP()

        self.pppobj.enableMSCHAP()
        self.pppobj.setDns(self.paras['dns'])
        self.ipsecobj.replacePSK(self.paras['psk'])

        self.radiusobj.enableCHAP()
        self.ipsecobj.unload()
        self.vpnobj.unload()
        self.pppobj.unload()
        
        if self.paras['domain'] == "ad":
            self.mschap_set_ad()
        elif self.paras['domain'] == "ldap":
            self.mschap_set_ldap()
        else:
            self.ntlm_create_localusers()
            
        return {'status' : 0}

    def config2paras(self, config):
        for key in config:
            if self.paras.has_key(key) == False:
                self.paras[key] = config[key]

    def xl2tpd_options_pap(self):
        pppobj = ppp.PPP()

        self.vpnobj.setLocalip(self.paras['ip_pool'], self.paras['max_conns'])
        self.vpnobj.enablePAP()
        pppobj.enablePAP()
        pppobj.setDns(self.paras['dns'])
        self.ipsecobj.replacePSK(self.paras['psk'])

        self.radiusobj.enablePAP()
        self.vpnobj.unload()
        self.ipsecobj.unload()
        pppobj.unload()
        return {'status' : 0}
    
    @decor_vpn
    def xl2tpd_options(self):
        getattr(self, 'xl2tpd_options_%s'%self.paras['auth'])()
        ret = self.interface.saveConfig(self.paras, "write")
        ret = self.interface.getConfig(self.paras, "getter")
        self.interface.log(str(ret))
        return ret
    
    def setParas(self, paras):
        self.paras = paras

    def mschap_adduser(self):
        self.radiusobj.NTLMPasswd_adduser(self.paras['user'], self.paras['passwd'])
        return self.radiusobj.restart()

    def mschap_deleteuser(self):
        self.radiusobj.NTLMPasswd_deleteuser(self.paras['user'])
        return self.radiusobj.restart()

    def mschap_modifyuser(self):
        self.radiusobj.NTLMPasswd_deleteuser(self.paras['user'])
        self.radiusobj.NTLMPasswd_adduser(self.paras['user'], self.paras['passwd'])
        return self.radiusobj.restart()
        
    def enableAD(self):
        self.radiusobj.enableAD()
        return self.radiusobj.restart()

    def disableAD(self):
        self.radiusobj.disableAD()
        return self.radiusobj.restart()

    def enableLDAP(self, paras):
        self.radiusobj.enableLDAP(paras)
        return self.radiusobj.restart()

    def disableLDAP(self):
        self.radiusobj.disableLDAP()
        return self.radiusobj.restart()

    @decor_vpn
    def xl2tpd_restore(self):
        self.paras['proto'] = "xl2tpd"
        if self.paras['enabled'] == "True":
            ret = self.xl2tpd_status()
            if ret['data']['status'] == False:
                getattr(self, 'xl2tpd_options_%s'%self.paras['auth'])()
                self.xl2tpd_restart()
        return {'status' : 0}
        
    def mschap_set_local(self):
        return self.radiusobj.restart()

    def mschap_set_ad(self):
        return self.enableAD()
    
    def mschap_set_ldap(self):
        ret = self.interface.getLDAPConfig(self.paras)
        if ret['status'] != 0:
            return {"status" : CANT_GET_LDAPCONFIG}
        cfg = ret['data']
        return self.enableLDAP([cfg['ipAddress'], cfg['rootDN'], cfg['password'], cfg['baseDN']])
        
    @decor_vpn
    def xl2tpd_mschap(self):
        if self.paras['auth'] == "pap":
            return {'status' : 0}
        
        self.radiusobj.disableAD()
        self.radiusobj.disableLDAP()
        func = getattr(self, "mschap_set_" + self.paras['usertype'])
        ret = func()
        if ret['status'] == 0:
            self.paras['domain'] = self.paras['usertype']
            ret = self.interface.saveConfig(self.paras, "write")
        return ret

    def enable_postrouting(self):
        ret = os.system("iptables -t nat -A POSTROUTING -s %s/24 -j MASQUERADE"%self.paras['ip_pool'])
        if ret != 0:
            self.log("Enable routing fail")
            return {'status' : ENABLE_ROUTING_FAIL}
        return {'status' : 0}

    def disable_postrouting(self):
        cmd = CMD_DISABLE_ROUTING%self.paras['ip_pool']
        ret = os.system(cmd)
        if ret != 0:
            self.log("(%s,%s)"%(str(ret), cmd))
            return {'status' : DISABLE_ROUTING_FAIL}
        return {'status' : ret}

    def __call__(self):
        self.pppobj.reloadcfg()
        self.interface.log("receive paras:" + str(self.paras))
        func = getattr(self, self.paras['op'])
        return func()
