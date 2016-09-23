import sys
import os
import filecmp
sys.path.append("../")
import ipsec

def compareFile(src, dst):
    return filecmp.cmp(src,dst)

def decor_test(func):
    def wrap_func(obj):
        func(obj)
        obj.unload()
    return wrap_func
   
@decor_test
def _test_replacePSK(obj):
    obj.replacePSK("abcde")
    
def test_replacePSK():
    src = "/etc/strongswan/ipsec.secrets"
    dst = "exp_result/ipsec.secrets.replacepsk"
    obj = ipsec.IPSec("/etc/strongswan/ipsec.conf")
    _test_replacePSK(obj)
    assert True == compareFile(src, dst)

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
