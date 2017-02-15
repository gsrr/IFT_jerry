import os
import time
import trace_recipe

class HELLO:
    def __init__(self):
        pass

    def hello(self):
        ret = {"status" : 0, "data" : "return value"}
        return ret

def print_str(dic, hl):
    print dic['cnt'], "trace_ex2", hl.hello()
    print "-" * 16

def loop():
    cnt = 0
    hl = HELLO()
    while True:
        cnt += 1
        print_str({"cnt" : cnt}, hl)
        time.sleep(1)

if __name__ == '__main__':
    trace_recipe.trace_listen()
    print(os.getpid())
    loop()
