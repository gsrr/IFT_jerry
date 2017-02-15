import os
import time
import trace_ex2

def hello():
    ret = {"status" : 0, "data" : "return value"}
    return ret

def print_str(dic):
    print dic['cnt'], "trace_ex2", hello()
    print "-" * 16

def loop():
    cnt = 0
    while True:
        cnt += 1
        print_str({"cnt" : cnt})
        time.sleep(1)

if __name__ == '__main__':
    trace_ex2.trace_listen()
    print(os.getpid())
    loop()
