import sys
import os
import shutil
import copy


def read_conf():
    conf = {}
    with open("conf", "r") as fr:
        lines = fr.readlines()
        for line in lines:
            line = line.strip()
            key,value = line.split("=", 1)
            conf[key] = value
    return conf

def create_module_dir(module_name):
    if os.path.exists(module_name):
        ret = raw_input("Delete %s directory?(Y/N)"%module_name)
        if "y" == ret.lower():
            shutil.rmtree(module_name)
    shutil.copytree("template", module_name)

def initfile(f_path, conf):
    conf['module_name_upper'] = conf["module_name"].upper
    
    print "create file:%s"%f_path
    lines = None
    with open(f_path, "r") as fr:
        lines = fr.readlines()    

    keywords = ["[module_name]", "[module_name_upper]", "[cli_position]", "[lib_position]"]
    with open(f_path, "w") as fw:
        for line in lines:
            for key in keywords:
                if key in line :
                    print line
                    line = line.replace(key, conf[key.lstrip("[").rstrip("]")])
                    print line

def init():
    print "init...."
    conf = read_conf()
    print conf
    module_name = conf['module_name']
    create_module_dir(module_name)

    files = os.walk("template")
    for (dirpath, dirname, filename) in files:
        for f in filename:
            f = dirpath + "/" + f
            f = f.replace("template", conf['module_name'])
            initfile(f , conf)

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
