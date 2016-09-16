import argparse

class VPNParser:
    def __init__(self):
        self.cmds = ['vpn_config']
        self.parser_vpn = argparse.ArgumentParser(prog="vpn", add_help=False)
        self.parser_vpn_config = argparse.ArgumentParser(prog="vpn_config", add_help=False)
        self.parser_vpn_config.add_argument("-z", nargs="?", required=True)
        self.parser_vpn_config.add_argument("-p", nargs="?")
        self.parser_vpn_config.add_argument("-x", nargs="?")
        self.parser_vpn_config.add_argument("-a", nargs="?", choices=["chap", "pap"])
        self.parser_vpn_config.add_argument("-k", nargs="?")
        self.parser_vpn_config.add_argument("-d", nargs="?")
    def find(self, args):
        cnt = 0
        cmd = "vpn"
        while cnt < len(args):
            cmd += ("_" + args[cnt])
            if cmd in self.cmds:
                break
            cnt += 1
        args = args[cnt+1:]
        namespace = getattr(self, "parser" + "_" + cmd).parse_args(args).__dict__
        return cmd, namespace
