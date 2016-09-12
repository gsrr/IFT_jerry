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
            

class ConfigLoader:
    def __init__(self, **paras):
        self.cfg_dict = {}
        self.cfg_list = []
        self.cfgpath = paras['cfg']
    
    def load(self):
        data = {}
        with open(self.cfgpath, "r") as fr:
            lines = fr.readlines()
            for line in lines:
                line = line.strip()
                if line != "" and line.startswith("#") == False:
                    key,value = MyString.splitTwo(line, None)
                    if len(self.cfg_list) == 0 or self.cfg_list[-1] != key:
                        self.cfg_list.append(key)
                         
                    if data.has_key(key) == False:
                        data[key] = value
                    else:
                        if type(data[key]) == list:
                            data[key].append(value)
                        else:
                            data[key] = [data[key]]
                            data[key].append(value)
        self.cfg_dict = data

    def unload(self, path, tabs=2):
        with open(path, "w") as fw:
            for key in self.cfg_list:
                value = self.cfg_dict.get(key)
                if value != None:
                    if type(value) == list:
                        for v in value:
                            fw.write(key + " " + v + "\n")
                    else:
                        fw.write(key + " " + value + "\n")
                    del self.cfg_dict[key]

    def setcfg(self, key, value):
        self.cfg_dict[key] = value
    
    def add(self, key, value):
        self.cfg_dict[key] = value

    def remove(self, key):
        if self.cfg_dict.has_key(key):
            del self.cfg_dict[key]
        
class ConfigVPNL2TP(ConfigLoader):
    def __init__(self, **paras):
        ConfigLoader.__init__(self, **paras)
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


    def unload(self, path, tabs=2):
        delimit = self.delimit if self.delimit != None else " "
        with open(path, "w") as fw:
            for key, value in self.cfg.items():
                if type(self.cfg[key]) == dict:
                    fw.write("\n" + key + "\n")
                    for key, value in self.cfg[key].items():
                        fw.write( "\t" + key + delimit + value + "\n")
                else:
                    fw.write(key + delimit + value + "\n")

    def add(self, section, key, value):
        self.cfg[section][key] = value

    def remove(self, section, key):
        if self.cfg[section].has_key(key) == True:
            del self.cfg[section][key]

class ConfigIPSec(ConfigVPNL2TP):
    def __init__(self, **paras):
        ConfigVPNL2TP.__init__(self, **paras)
        self.mark = "#"
        self.title = ["config", "conn"]
        self.delimit = "="
        
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
