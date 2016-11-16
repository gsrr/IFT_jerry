import socket;
import sys
import subprocess

prog_name = "nmap_port_check.py"
arg_type = "<type> <ip>"
arg_num = 2

def usage():
    return "Format: python %s %s"%(prog_name, arg_type)

def nullscan(args):
    ip = args[1]
    subprocess.call("nmap -sN %s"%ip, shell = True)

def tcpscan(args):
    ip = args[1]
    subprocess.call("nmap -sT %s"%ip, shell = True)
    
def execute():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func(sys.argv[1:])

def main():
    if len(sys.argv) < (arg_num + 1):
        print usage()
    else:
        execute()

if __name__ == "__main__":
    main()
