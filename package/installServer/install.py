import sys
import commands

def exec_cmd_str(cmd):
    output = commands.getoutput(cmd).splitlines()
    return output
    
def module_check_yum(module):
        output = exec_cmd_str(module['cmd'])
        for line in output:
            if "No matching Packages" in line:
                return False
        return True

def vim_install_check_package(func):
    def wrap_func():
        need_modules = {
            'git' : {'cmd' : 'yum list installed git', 'type' : 'yum'},
        }
        for key in need_modules.keys():
            module = need_modules[key]
            ret_bool = getattr(sys.modules[__name__], "module_check_%s"%(module['type']))(module)
            if not ret_bool:
                print "%s is not be installed!"%(key)
            else:
                print "%s has been installed!"%(key)
                
    return wrap_func

@vim_install_check_package
def vim_install():
    pass

def main():
    getattr(sys.modules[__name__], sys.argv[1])()

if __name__ == "__main__":
    main()
