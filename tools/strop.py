import sys
import getopt

def usage():
    return [
        "help menu",
    ]

def str2hex(paras):
    msg = paras['msg']
    print "input:", msg
    print "input(hex):", msg.encode("hex").upper()

def main():
    try:
        paras = {}
        opts, args = getopt.getopt(sys.argv[1:], "hc:m:", ["help", "cmd=", "msg="])
        for o, a in opts:
            if o in ("-h", "--help"):
                print usage()
            elif o == "-c":
                paras['cmd'] = a
            elif o == "-m":
                paras['msg'] = a

        func = getattr(sys.modules[__name__], paras['cmd'])
        func(paras)

    except getopt.GetoptError as err:
        print str(err) 
        sys.exit(2)


if __name__ == "__main__":
    main()
