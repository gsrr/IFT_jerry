

class LIBFace:
    def __init__(self):
        pass

    def call(self, args):
        print "LIBFace call"

def args2paraList(para_map, args, paraList):
    for key in para_map.keys():
        if args[key] != None:
            paraList[para_map[key]] = args[key]

class VPNCmd:
    def __init__(self, libface):
        self.libface = libface

    def cmd_vpn_config(self,args):
        para_map = {
            'p' : 'ip_pool',
            'x' : 'max_conns',
            'a' : 'auth',
            'k' : 'psk',
            'd' : 'dns',
        }
        paraList = {}
        args2paraList(para_map, args, paraList)
        if len(paraList) == 0:
            paraList['proto'] = "xl2tpd"
            paraList['op'] = "xl2tpd_config"
        else:
            paraList['proto'] = "xl2tpd"
            paraList['op'] = "xl2tpd_options"
        return self.libface.call(paraList)

    def cmd_vpn_act(self,args):
        para_map = {
            'a' : 'op',
        }
        paraList = {}
        args2paraList(para_map, args, paraList)
        paraList['proto'] = "xl2tpd"
        paraList['op'] = "xl2tpd_%s"%paraList['op']
        return self.libface.call(paraList)

    def cmd_vpn_view(self,args):
        para_map = {}
        paraList = {}
        args2paraList(para_map, args, paraList)
        paraList['op'] = "xl2tpd_view"
        return self.libface.call(paraList)

    def cmd_vpn_cut(self,args):
        para_map = {
            'c' : 'vpnip',
        }
        paraList = {}
        args2paraList(para_map, args, paraList)
        paraList['op'] = "xl2tpd_cut"
        return self.libface.call(paraList)

    def cmd_vpn_status(self,args):
        para_map = {}
        paraList = {}
        args2paraList(para_map, args, paraList)
        paraList['op'] = "xl2tpd_status"
        return self.libface.call(paraList)

    def cmd_vpn_mschap(self,args):
        para_map = {
            'u' : 'usertype',
        }
        paraList = {}
        args2paraList(para_map, args, paraList)
        paraList['proto'] = "xl2tpd"
        paraList['op'] = "xl2tpd_mschap"
        return self.libface.call(paraList)

def main():
    lf = LIBFace()
    vpn = VPNCmd(lf)
    vpn.cmd_vpn_config()

if __name__ == '__main__':
    main()
