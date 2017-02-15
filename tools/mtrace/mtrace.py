import sys
import trace
import main
import os
import time
import signal
import traceback

debug = 0

def tracefunc(frame, event, arg, indent=[0]):
    print event
    if event == "call":
        indent[0] += 2
        print "-" * indent[0] + "> call function", frame.f_code.co_name
    elif event == "return":
        print "<" + "-" * indent[0], "exit function", frame.f_code.co_name
        indent[0] -= 2
    return tracefunc

def handle_trace(sig, frame):
    try:
        global debug
        print "handle_trace - start"
        print debug
        if debug == 0:
            print "set trace"
            sys.settrace(tracefunc)
            tracer = trace.Trace()
            tracer.run('loop()')
            debug = 1
        else:
            del tracer
            debug = 0
        print debug
        print "handle_trace - end"
    except:
        print traceback.format_exc()

def loop():
    cnt = 0
    while True:
        print "11111111111111"
        print cnt
        cnt += 1
        time.sleep(1)
        main.main()
        print "----------------"

if __name__ == '__main__':
    signal.signal(signal.SIGUSR1, handle_trace)
    print(os.getpid())
    loop()
