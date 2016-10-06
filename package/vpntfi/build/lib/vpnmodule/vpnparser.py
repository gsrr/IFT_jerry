import argparse

class VPNParser:
    def __init__(self):
        self.cmds = ['vpn_config', 'vpn_act', 'vpn_cut', 'vpn_view', 'vpn_status', 'vpn_mschap']
        self.parser_vpn = argparse.ArgumentParser(prog="vpn", add_help=False)
        self.parser_vpn_config = argparse.ArgumentParser(prog="vpn_config", add_help=False)
        self.parser_vpn_config.add_argument("-z", nargs="?", required=True)
        self.parser_vpn_config.add_argument("-p", nargs="?")
        self.parser_vpn_config.add_argument("-x", nargs="?")
        self.parser_vpn_config.add_argument("-a", nargs="?", choices=["mschap", "pap"])
        self.parser_vpn_config.add_argument("-k", nargs="?")
        self.parser_vpn_config.add_argument("-d", nargs="?")

        self.parser_vpn_act = argparse.ArgumentParser(prog="vpn_act", add_help=False)
        self.parser_vpn_act.add_argument("-z", nargs="?", required=True)
        self.parser_vpn_act.add_argument("-a", nargs="?", choices=["start", "stop", "restart"])

        self.parser_vpn_cut = argparse.ArgumentParser(prog="vpn_cut", add_help=False)
        self.parser_vpn_cut.add_argument("-z", nargs="?", required=True)
        self.parser_vpn_cut.add_argument("-c", nargs="*")

        self.parser_vpn_view = argparse.ArgumentParser(prog="vpn_view", add_help=False)
        self.parser_vpn_view.add_argument("-z", nargs="?", required=True)

        self.parser_vpn_status = argparse.ArgumentParser(prog="vpn_status", add_help=False)
        self.parser_vpn_status.add_argument("-z", nargs="?", required=True)

        self.parser_vpn_mschap = argparse.ArgumentParser(prog="vpn_mschap", add_help=False)
        self.parser_vpn_mschap.add_argument("-z", nargs="?", required=True)
        self.parser_vpn_mschap.add_argument("-u", nargs="?", choices=["local", "ad", "ldap"])

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
