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

def initfile(sfile, conf):
    conf['module_name_upper'] = conf["module_name"].upper()
    s2d = {
        'cli.py' : conf['module_name'] + ".py",
        'lib.py' : conf['module_name'] + "lib.py",
        'restore.py' : conf['module_name'] + "restore.py",
        'config.py' : conf['module_name_upper'] + "Config.py",
        'config.xml' : conf['module_name_upper'] + "Config.xml",
        'info.py' : conf['module_name_upper'] + "Info.py",
        'parser.py' : conf['module_name'] + "parser.py",
    }
    
    lines = None
    with open(sfile, "r") as fr:
        lines = fr.readlines()    

    keywords = ["[module_name]", "[module_name_upper]", "[cli_position]", "[lib_position]"]
    try:
        dfile = os.path.dirname(sfile) + "/" + s2d[os.path.basename(sfile)] 
        os.remove(sfile)
    except:
        dfile = sfile

    print "create file:%s"%dfile
    with open(dfile, "w") as fw:
        for line in lines:
            for key in keywords:
                if key in line :
                    line = line.replace(key, conf[key.lstrip("[").rstrip("]")])

            fw.write(line)
def init():
    print "init...."
    conf = read_conf()
    print conf
    module_name = conf['module_name']
    create_module_dir(module_name)

    files = os.walk(conf['module_name'])
    for (dirpath, dirname, filename) in files:
        for f in filename:
            f = dirpath + "/" + f
            f = f.replace("template", conf['module_name'])
            #os.system()
            initfile(f , conf)

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
