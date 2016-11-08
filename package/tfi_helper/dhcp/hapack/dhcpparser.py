import argparse

class DHCPParser:
    def __init__(self):
        self.cmds = ['dhcp_test']
        self.parser_dhcp = argparse.ArgumentParser(prog="dhcp", add_help=False)
        self.parser_dhcp_test = argparse.ArgumentParser(prog="dhcp_test", add_help=False)
        self.parser_dhcp_test.add_argument("-z", nargs="?", required=True)

    def find(self, args):
        cnt = 0
        cmd = "dhcp"
        while cnt < len(args):
            cmd += ("_" + args[cnt])
            if cmd in self.cmds:
                break
            cnt += 1
        args = args[cnt+1:]
        namespace = getattr(self, "parser" + "_" + cmd).parse_args(args).__dict__
        return cmd, namespace
