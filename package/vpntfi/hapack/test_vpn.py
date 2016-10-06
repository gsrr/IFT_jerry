import os
import sys






def test_is_for_primary():
    os.system('echo -e "vpn config -z b@0\nexit\n" | NASCLI')

def test_vpn_config():
    os.system('echo -e "vpn config -z a@0\nexit\n" | NASCLI')

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()


if __name__ == "__main__":
    main()