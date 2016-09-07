import sys


class MyString:

    @staticmethod
    def splitTwo(line, delimit):
        try:
            args = line.split(delimit, 1)
            if len(args) == 1:
                return args[0].strip(), ""
            else:
                return args[0].strip(), args[1].strip()
        except:
            pass
            

class ConfigBase:
    def __init__(self, **paras):
        self.cfg = {}
        self.cfgpath = paras['cfg']
    
    def load(self):
        data = {}
        with open(self.cfgpath, "r") as fr:
            lines = fr.readlines()
            for line in lines:
                line = line.strip()
                if line != "" and line.startswith("#") == False:
                    key,data[key] = MyString.splitTwo(line, None)
        self.cfg = data

    def setcfg(self, key, value):
        self.cfg[key] = value
    
    def remove(self, key):
        del self.cfg[key]

    def unload(self, path, tabs=2):
        with open(path, "w") as fw:
            for key, value in self.cfg.items():
                if type(self.cfg[key]) == dict:
                    fw.write("\n" + key + "\n")
                    for key, value in self.cfg[key].items():
                        fw.write( key + "=" + value + "\n")
                else:
                    fw.write(key + "=" + value + "\n")
        

class ConfigL2TP(ConfigBase):
    def __init__(self, **paras):
        ConfigBase.__init__(self, **paras)
        self.title = "["
        self.delimit = "="
        self.mark = ";"

    def _subload(self, lines, data):
        cnt = 0
        while cnt < len(lines):
            line = lines[cnt].strip()
            if line != "" and line.startswith(self.mark) == False:
                if line.startswith(self.title):
                    return cnt
                else:
                    key,data[key] = MyString.splitTwo(line, self.delimit)
            cnt += 1
        return cnt 

    def load(self):
        data = {}
        cnt = 0
        with open(self.cfgpath, "r") as fr:
            lines = fr.readlines()
            while cnt < len(lines):
                line = lines[cnt].strip()
                if line != "" and line.startswith(self.mark) == False:
                    if self.title != None and line.startswith(self.title):
                        data[line.strip()] = {}
                        cnt += self._subload(lines[cnt+1:], data[line.strip()])
                    else:
                        key,data[key] = MyString.splitTwo(line, self.delimit)
                cnt += 1
        self.cfg = data

def main():
    obj = Config(cfg="/etc/pptpd.conf.default", mark="#", delimit=None)
    obj.load()
    print obj.cfg
    obj.setcfg("test","test")
    print obj.cfg
    obj.remove("test")
    print obj.cfg
    obj.unload("/etc/pptpd.conf")


if __name__ == "__main__":
    main()
