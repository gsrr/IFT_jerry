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
        self.interface = paras['interface']
        self.paras = paras['paras']
        self.vpnobj = vpnL2tp.VPNL2TP()
        self.radiusobj = radius.RADIUS()
        self.ipsecobj = ipsec.IPSec()
    
    def xl2tpd_start(self):
        self.vpnobj.start()
        self.radiusobj.start()
        return {'status' : 0}

    def xl2tpd_stop(self):
        self.vpnobj.stop()
        self.radiusobj.stop()
        return {'status' : 0}

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
        ret = self.vpnobj.cut(self.paras['vpnip'])
        return {'status' : 0}

    def xl2tpd_options_chap(self):
        print "xl2tpd_options_chap"
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

        self.interface.saveConfig(self.paras, "write")

        return {'status' : 0}

    def xl2tpd_options_pap(self):
        vpnobj = vpnL2tp.VPNL2TP()
        pppobj = ppp.PPP()
        ipsecobj = ipsec.IPSec()
        radiusobj = radius.RADIUS()

        vpnobj.setLocalip(self.paras['ip_pool'], self.paras['max_conns'])
        vpnobj.enablePAP()
        
        pppobj.enablePAP()
        pppobj.setDns(self.paras['dns'])
        ipsecobj.replacePSK(self.paras['psk'])

        vpnobj.unload()
        pppobj.unload()
        
        radiusobj.enablePAP()

        vpnobj.start()
        radiusobj.start()
        self.interface.saveConfig(self.paras, "write")
        return {'status' : 0}

    def __call__(self):
        self.interface.log("It is a VPNLibTest")
        self.interface.log(str(self.paras))
        func = getattr(self, self.paras['op'])
        return func()
