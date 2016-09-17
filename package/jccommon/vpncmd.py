

class LIBFace:
    def __init__(self):
        pass

    def call(self, args):
        print "LIBFace call"

class VPNCmd:
    def __init__(self, libface):
        self.libface = libface

    def cmd_vpn_config(self,args):
        print "cmd_vpn_config", args
        self.libface.call(args)

    def cmd_vpn_act(self,args):
        print "cmd_vpn_act", args

    def cmd_vpn_cut(self,args):
        print "cmd_vpn_cut", args

    def cmd_vpn_view(self,args):
        print "cmd_vpn_view", args

    def cmd_vpn_status(self,args):
        print "cmd_vpn_status", args

def main():
    lf = LIBFace()
    vpn = VPNCmd(lf)
    vpn.cmd_vpn_config()

if __name__ == '__main__':
    main()
