import sys


def disable_selinux():
    pass

def all():
    settings = [
        'disable_selinux',
        
    ]
    for setting in settings:
        print setting
        func = getattr(sys.modules[__name__], setting)
        func()
        


import os
def hello():
    print "Hello World"

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])

if __name__ == "__main__":
    main()
    hello()
    hell()
    aaaa()
