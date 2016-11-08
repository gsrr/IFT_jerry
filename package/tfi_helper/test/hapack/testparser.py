import argparse

class TESTParser:
    def __init__(self):
        self.cmds = ['test_test']
        self.parser_test = argparse.ArgumentParser(prog="test", add_help=False)
        self.parser_test_test = argparse.ArgumentParser(prog="test_test", add_help=False)
        self.parser_test_test.add_argument("-z", nargs="?", required=True)

    def find(self, args):
        cnt = 0
        cmd = "test"
        while cnt < len(args):
            cmd += ("_" + args[cnt])
            if cmd in self.cmds:
                break
            cnt += 1
        args = args[cnt+1:]
        namespace = getattr(self, "parser" + "_" + cmd).parse_args(args).__dict__
        return cmd, namespace
