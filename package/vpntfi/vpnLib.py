import sys
import traceback

sys.path.append("/Pool-1/f1/github/IFT_jerry/package/")
import vpnserver

lib_vpnObj = None

class HAVPNFace(vpnserver.VPNFace):
    def __init__(self):
        self.ha = None

    def log(self, msg):
        self.ha.log(1, msg)
       
    def setHA(self, HA):
        self.ha = HA

class NASHAVPNFace(vpnserver.VPNFace):
    def __init__(self):
        self.ha = None

    def log(self, msg):
        pass
       
    def setHA(self, HA):
        self.ha = HA

def vpnLib(HAServer, paraList):
    try:
        global lib_vpnObj
        if lib_vpnObj == None:
            reload(vpnserver)
            haface = HAVPNFace()
            haface.setHA(HAServer)
            lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
        HAServer.log(1, "call vpnLib")
        return lib_vpnObj()
    except:
        return {'status' : -999, 'exception' : traceback.format_exc()}
  
def decor_test(func):
    def wrap_func(HAServer):
        haface = NASHAVPNFace()
        haface.setHA(HAServer)
        obj = func(haface)
        print obj()
    return wrap_func

@decor_test
def test_xl2tpd_options_pap(haface):
    paraList = {
        'op' : 'xl2tpd_options_pap',
        'ip_pool' : '20.10.0.0',
        'max_conns' : '10',
        'auth' : 'pap',
        'psk' : 'psk123',
        'dns' : '8.8.8.8',
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
    return lib_vpnObj 

@decor_test
def test_xl2tpd_options_chap(haface):
    paraList = {
        'op' : 'xl2tpd_options_chap',
        'ip_pool' : '20.10.0.0',
        'max_conns' : '10',
        'auth' : 'chap',
        'psk' : 'psk246',
        'dns' : '8.8.8.8',
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
    return lib_vpnObj 

@decor_test
def test_act_xl2tpd_start(haface):
    paraList = {
        'op' : 'act_xl2tpd_start',
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
    return lib_vpnObj 

@decor_test
def test_act_xl2tpd_stop(haface):
    paraList = {
        'op' : 'act_xl2tpd_stop',
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
    return lib_vpnObj 

@decor_test
def test_act_xl2tpd_restart(haface):
    paraList = {
        'op' : 'act_xl2tpd_restart',
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
    return lib_vpnObj 

@decor_test
def test_xl2tpd_status(haface):
    paraList = {
        'op' : 'xl2tpd_status',
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
    return lib_vpnObj 

def clean_env(haface):
    os.system("ps -ef | grep radiusd | grep -v grep | awk '{print $2}' | kill -9}")
    

def main(HAServer):
    func = getattr(sys.modules[__name__], sys.argv[1])
    func(HAServer)
    
if __name__ == "__main__":
	try:
		sys.path.append("/usr/local/NAS/misc/HAAgent")
		from NASHAComm import *
		HA = NASHAComm("127.0.0.1")
		main(HA)
	except:
		print traceback.format_exc()
	finally:
		HA.closeSocket()
