from vpnmodule.lib import vpnL2tp
from vpnmodule.lib import ppp
from vpnmodule.lib import ipsec
from vpnmodule.lib import radius

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
    
    def act_start(self):
        self.vpnobj.start()
        self.radiusobj.start()

    def act_stop(self):
        self.vpnobj.stop()
        self.radiusobj.stop()

    def act_restart(self):
        self.vpnobj.restart()
        self.radiusobj.restart()

    def act_status(self):
        self.vpnobj.status()
        self.radiusobj.status()

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
        return {'status' : 0}

    def __call__(self):
        self.interface.log("It is a VPNLibTest")
        self.interface.log(str(self.paras))
        func = getattr(self, self.paras['op'])
        return func()

    def setconns(self):
        pass

    def setpsk(self):
        pass

    def setdns(self):
        pass
