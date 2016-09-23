import unittest
import test

class TestTest(unittest.TestCase):

    def setUp(self):
        print "setUp"

    def test_config_pptpd(self):
        obj = test.ConfigBase(cfg="/etc/pptpd.conf.default")
        obj.load()
        goal = "{'connections': '100', 'localip': '10.0.0.0', 'logwtmp': '', 'option': '/etc/ppp/options.pptpd', 'remoteip': '10.0.0.1-254'}"
        self.assertEqual(str(obj.cfg), goal)
        obj.unload("/etc/pptpd.conf")
        
    def test_config_xlt2pd(self):
        obj = test.ConfigL2TP(cfg="/etc/xl2tpd/xl2tpd.conf.default")
        obj.load()
        goal = "{'[lns default]': {'ip range': '20.0.0.100-20.0.0.254', 'local ip': '20.0.0.1', 'ppp debug': 'yes', 'name': 'LinuxVPNserver', 'require chap': 'yes', 'require authentication': 'yes', 'refuse pap': 'yes', 'length bit': 'yes', 'pppoptfile': '/etc/ppp/options.xl2tpd'}, '[global]': {}}"
        self.assertEqual(str(obj.cfg), goal)
        obj.unload("/etc/xl2tpd/xl2tpd.conf")

    def tearDown(self):
        print "tearDown"

if __name__ == '__main__':
    unittest.main(verbosity=2)
