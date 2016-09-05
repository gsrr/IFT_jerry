import sys

class Config:
    def __init__(self, paras):
        self.cfg = None
        self.cfgpath = paras['cfg']

    def load(self):
        data = {}
        with open(self.cfgpath, "r") as fr:
            lines = fr.readlines()
            for line in lines:
                line = line.strip()
                if line != "" and line.startswith("#") == False:
                    args = line.split(None, 1)
                    if len(args) == 1:
                        data[args[0]] = True
                    else:
                        key,value = line.split(None, 1)
                        data[key] = value
                    

        self.cfg = data

def main():
    paras = {}
    paras['cfg'] = sys.argv[1]
    obj = Config(paras)
    obj.load()
    print obj.cfg

if __name__ == "__main__":
    main()
