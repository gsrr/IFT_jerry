import argparse

class VPNParser:
    def __init__(self):
        self.parser_vpn_config = argparse.ArgumentParser(prog="vpn_config", add_help=False)
        self.parser_vpn_config.add_argument("subcmd", nargs=1, required=True)
        self.parser_vpn_config.add_argument("-z", nargs="?", required=True)
        self.parser_vpn_config.add_argument("-p", nargs="?")
        self.parser_vpn_config.add_argument("-x", nargs="?")
        self.parser_vpn_config.add_argument("-a", nargs="?", choices=["chap", "pap"])
        self.parser_vpn_config.add_argument("-k", nargs="?")
        self.parser_vpn_config.add_argument("-d", nargs="?")
