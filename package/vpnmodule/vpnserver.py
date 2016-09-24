from lib import vpnL2tp
from lib import ppp
from lib import ipsec
from lib import radius


STATUS_FAILED = 1001


class VPNFace:
    def __init__(self):
        pass

    def log(self):
        pass

class VPNServer:
    def __init__(self, **paras):
        reload(vpnL2tp)
        self.interface = paras['interface']
        self.vpnobj = vpnL2tp.VPNL2TP()
        self.radiusobj = radius.RADIUS()
        self.ipsecobj = ipsec.IPSec()
    
    def xl2tpd_start(self):
        self.vpnobj.start()
        self.radiusobj.start()
        return self.interface.saveConfig({'proto':'xl2tpd', 'enabled' : "True"}, "write")

    def xl2tpd_stop(self):
        self.vpnobj.stop()
        self.radiusobj.stop()
        return self.interface.saveConfig({'proto': 'xl2tpd', 'enabled' : "False"}, "write")

    def act_xl2tpd_restart(self):
        self.vpnobj.restart()
        self.radiusobj.restart()

    def xl2tpd_status(self):
        ret = []
        ret.append(self.vpnobj.status())
        ret.append(self.ipsecobj.status())
        ret.append(self.radiusobj.status())
        if ret[0] == "active" and ret[1] == "active" and ret[2] == "active":
            return {'status': 0, 'data' : {"status" : "active"} }
        else:
            return {'status': STATUS_FAILED, 'data' : {"status" : "failed"} }
            
    def xl2tpd_view(self):
        data = self.vpnobj.view()
        return {'status' : 0, 'data' : data}

    def xl2tpd_cut(self):
        self.interface.log("xl2tpd_cut:" + self.paras['vpnip'])
        ret = self.vpnobj.cut(self.paras['vpnip'])
        return {'status' : 0}

    def xl2tpd_options_mschap(self):
        pppobj = ppp.PPP()
        ipsecobj = ipsec.IPSec()

        self.vpnobj.setLocalip(self.paras['ip_pool'], self.paras['max_conns'])
        self.vpnobj.enableCHAP()

        pppobj.enableCHAP()
        pppobj.setDns(self.paras['dns'])
        ipsecobj.replacePSK(self.paras['psk'])

        self.radiusobj.enableCHAP()
        self.vpnobj.unload()
        pppobj.unload()
        return {'status' : 0}

    def config2paras(self, config):
        for key in config:
            if self.paras.has_key(key) == False:
                self.paras[key] = config[key]

    def xl2tpd_options_pap(self):
        pppobj = ppp.PPP()
        ipsecobj = ipsec.IPSec()
        radiusobj = radius.RADIUS()

        self.vpnobj.setLocalip(self.paras['ip_pool'], self.paras['max_conns'])
        self.vpnobj.enablePAP()
        
        pppobj.enablePAP()
        pppobj.setDns(self.paras['dns'])
        ipsecobj.replacePSK(self.paras['psk'])

        radiusobj.enablePAP()
        self.vpnobj.unload()
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

    def __call__(self):
        self.interface.log("It is a VPNLibTest")
        self.interface.log("receive paras:" + str(self.paras))
        func = getattr(self, self.paras['op'])
        return func()
