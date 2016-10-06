from lib import vpnL2tp
from lib import ppp
from lib import ipsec
from lib import radius
import os


STATUS_FAILED = 1001


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
    
    def log(self, msg):
        self.interface.log(msg)

    def xl2tpd_start(self):
        self.vpnobj.start()
        self.radiusobj.start()
        self.enable_postrouting()
        return self.interface.saveConfig({'proto':'xl2tpd', 'enabled' : "True"}, "write")

    def xl2tpd_stop(self):
        self.vpnobj.stop()
        self.radiusobj.stop()
        self.disable_postrouting()
        return self.interface.saveConfig({'proto': 'xl2tpd', 'enabled' : "False"}, "write")

    def xl2tpd_restart(self):
        self.vpnobj.restart()
        self.radiusobj.restart()
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

        self.vpnobj.unload()
        self.ipsecobj.unload()
        pppobj.unload()
        return {'status' : 0}
    
    def xl2tpd_options(self):
        ret = self.interface.getConfig(self.paras, "getter")
        self.config2paras(ret['data'])
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

    def enableLDAP(self):
        paras = [self.paras['ldapip'], self.paras['rootdn'], self.paras['passwd'], self.paras['basedn']]
        self.radiusobj.enableLDAP(paras)
        return self.radiusobj.restart()

    def disableLDAP(self):
        self.radiusobj.disableLDAP()
        return self.radiusobj.restart()

    def xl2tpd_restore(self):
        ret = self.interface.getConfig(self.paras, "getter")
        cfg = ret['data']
        self.config2paras(cfg)
        self.paras['proto'] = "xl2tpd"
        if self.paras['enabled'] == "True":
            ret = self.xl2tpd_status()
            if ret['data']['status'] == False:
                getattr(self, 'xl2tpd_options_%s'%self.paras['auth'])()
                self.xl2tpd_restart()
        return {'status' : 0}
        
    def enable_postrouting(self):
        os.system("iptables -t nat -A POSTROUTING -j MASQUERADE")
        return {'status' : 0}

    def disable_postrouting(self):
        os.system("iptables -t nat -D POSTROUTING -j MASQUERADE")
        return {'status' : 0}

    def __call__(self):
        self.pppobj.reloadcfg()
        self.interface.log("It is a VPNLibTest")
        self.interface.log("receive paras:" + str(self.paras))
        func = getattr(self, self.paras['op'])
        return func()
