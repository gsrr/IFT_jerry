import os 
from ConfigTemplate import *
import xml.etree.ElementTree as ET
import xml
import copy
import sys
import traceback

sys.path.append("/usr/local/NAS/misc/agent/python/")
from vpnmodule import vpnconfig

class VPNConfig(ConfigTemplate):

    def __init__ (self, serial):
        ConfigTemplate.__init__(self, serial)
        self.tree = ET.parse(self.getXMLPath('VPNConfig'))
        self.root = self.tree.getroot()
        self.vpnobj = vpnconfig.VPNConfig(self.root)
    
def main():
    x = LDAPServerConfig('1234')
    paras = {
        'configFunc' : 'addUser',
        'user' : sys.argv[2],
        'passwd' : 'abcd_1234',
        'desc' : "abcd",
        'mail' : "aaa@aaa.com",
        'controller' : 'a',
        'serviceid' : '0',
    }
    x.dispatch(paras)

    
if __name__ == "__main__":
    try:
        func = getattr(sys.modules[__name__], sys.argv[1])
        func()
    except:
        print traceback.format_exc()
        main()
        
    
