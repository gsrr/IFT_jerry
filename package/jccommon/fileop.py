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
