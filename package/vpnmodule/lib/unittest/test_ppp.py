import sys
import os
import filecmp
sys.path.append("../")
import ppp

def compareFile(src, dst):
    return filecmp.cmp(src,dst)

def decor_test(func):
    def wrap_func():
        src = "/etc/ppp/options.xl2tpd"
        obj = ppp.PPP(src)
        dst = func(obj)
        obj.unload()
        assert True == compareFile(src, dst)
        
    return wrap_func
   
@decor_test
def test_enableCHAP(obj):
    obj.enableCHAP()
    dst = "exp_result/options.xl2tpd.enablechap"
    return dst

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
