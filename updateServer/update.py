import os

def readFile(path):
    data = []
    with open(path , "r") as fr:
        lines = fr.readlines()
        for line in lines:
            line = line.strip()
            if line.startswith("#"):
                continue
            data.append(line)
    return data

def parsefiles(data):
    info = {}
    for line in data:
        line = line.strip()
        if line == "":
            break
        [key, value] = line.split("=",1)
        info[key] = value if info.has_key(key) == False else (info[key] + ("," + value))
    return info

def createExp(info, f):
    with open("./template.exp", "r") as fr:
        lines = fr.readlines()
        with open("ldapserver.exp" , "w") as fw:
            for line in lines:
                if "[nasip]" in line:
                    line = line.replace("[nasip]", info['nasip'])
                if "[src]" in line:
                    line = line.replace("[src]", info['src'] + f)
                if "[dst]" in line:
                    line = line.replace("[dst]", info['dst'] + f)
                fw.write(line)
    return 0
    

def main():
    data = readFile("update.config")
    info = parsefiles(data)
    for f in info['file'].split(","):
        createExp(info, f)
        os.system("expect ldapserver.exp")

if __name__ == "__main__":
    main()
