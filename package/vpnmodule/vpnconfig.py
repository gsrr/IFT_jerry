class VPNConfig:
    def __init__(self, root):
        self.root = root
    
    def get(self, paras):
        data = {}
        node = self.root.find("./setting[@module='%s']"%paras['proto'])
        for child in node:
            data[child.tag] = child.text

        return {'status' : 0, 'data' : data}

    def write(self, paras):
        node = self.root.find("./setting[@module='%s']"%paras['proto'])
        for child in node:
            if child.tag in paras.keys():
                child.text = paras[child.tag]
        return {'status' : 0}

    def __call__(self, paras):
        configFunc = paras['configop'] 
        func = getattr(self, configFunc)
        return func(paras)
