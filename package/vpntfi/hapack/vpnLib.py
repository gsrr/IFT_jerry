import sys
import traceback

sys.path.append("/usr/local/NAS/misc/agent/python/")
from vpnmodule import vpnserver

lib_vpnObj = None

class HAVPNFace(vpnserver.VPNFace):
    def __init__(self):
        self.ha = None

    def log(self, msg):
        self.ha.log(1, msg)
       
    def setHA(self, HA):
        self.ha = HA

    def saveConfig(self, paras, op):
        paras['configop'] = op
        return self.ha.setConfig("VPNConfig", "vpnobj", paras)

    def getConfig(self, paras, op):
        paras['configop'] = op
        return self.ha.getConfig("VPNConfig", "vpnobj", paras)
    
    def getLDAPConfig(self, paraList):
        paras = {}
        paras['ipAddress'] = ''
        paras['baseDN'] = ''
        paras['rootDN'] = ''
        paras['password'] = ''
        paras['controller'] = paraList.get('controller')
        paras['serviceId'] = paraList.get('serviceId')
        ret = self.ha.getConfig('AuthConfig', 'getLDAPConfig', paras)
        return ret

    def getLocalUsers(self, paraList):
        paras = {}
        paras['operation'] = "getPasswdHistory"
        paras['controller'] = paraList.get('controller')
        paras['serviceId'] = paraList.get('serviceId')
        ret = self.ha.callGetLocalFunc("userOperation", paras)
        return ret
        
class NASHAVPNFace(vpnserver.VPNFace):
    def __init__(self):
        self.ha = None

    def log(self, msg):
        pass
       
    def setHA(self, HA):
        self.ha = HA

def vpnLib(HAServer, paraList):
    try:
        HAServer.log(1, "In Lib:" + str(paraList))
        global lib_vpnObj
        if lib_vpnObj == None:
            reload(vpnserver)
            HAServer.log(1, "reload vpnLib")
            haface = HAVPNFace()
            haface.setHA(HAServer)
            lib_vpnObj = vpnserver.VPNServer(interface = haface)
        lib_vpnObj.setParas(paraList)
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

def test_xl2tpd_options_pap(localHA):
    paraList = {
        'op' : 'xl2tpd_options_pap',
        'ip_pool' : '20.10.0.0',
        'max_conns' : '10',
        'auth' : 'pap',
        'psk' : 'psk123',
        'dns' : '8.8.8.8',
        'proto' : "xl2tpd",
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    print ret
    return

def test_xl2tpd_options_pap_dns(localHA):
    paraList = {
        'op' : 'xl2tpd_options_pap',
        'dns' : '9.9.9.9',
        'proto' : "xl2tpd",
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    print ret
    return

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

def test_xl2tpd_start(localHA):
    paraList = {
        'op' : 'xl2tpd_start',
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    return ret

def test_xl2tpd_stop(localHA):
    paraList = {
        'op' : 'xl2tpd_stop',
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    return ret

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

@decor_test
def test_xl2tpd_view(haface):
    paraList = {
        'op' : 'xl2tpd_view',
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface, paras = paraList)
    return lib_vpnObj 

@decor_test
def test_xl2tpd_cut(haface):
    paraList = {
        'op' : 'xl2tpd_cut',
        'vpnip' : "20.0.0.1",
        'controller' : 'A',
        'serviceId' : '0'
    }
    lib_vpnObj = vpnserver.VPNServer(interface = haface)
    lib_vpnObj.setParas(paraList)
    return lib_vpnObj 

def test_mschap_adduser(localHA):
    paraList = {
        'op' : 'mschap_adduser',
        'user' : 'test123',
        'passwd' : 'test123',
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    return ret

def test_mschap_deleteuser(localHA):
    paraList = {
        'op' : 'mschap_deleteuser',
        'user' : 'test123',
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    return ret

def test_xl2tpd_restore(localHA):
    paraList = {
        'op' : 'xl2tpd_restore',
        'proto' : "xl2tpd",
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    return ret

def test_enable_debug(localHA):
    paraList = {
        'op' : 'enable_debug',
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    return ret

def test_disable_debug(localHA):
    paraList = {
        'op' : 'disable_debug',
        'controller' : 'A',
        'serviceId' : '0'
    }
    ret = localHA.callGetLocalFunc("vpnLib", paraList)
    return ret

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


