import signal
import os
import sys
import traceback
import threading

DEBUG_MODE = False

def log_trace(msgs):
    msg = "::".join(msgs)
    with open("./trace.log", 'a') as fw:
        fw.write("%s\n"%msg)

def tracefunc(frame, event, arg, indent=[0]):
    try:
        if event == "call":
            indent[0] += 2
            #msgs = ["-" * indent[0] + ">", "enter", frame.f_code.co_name, str(frame.f_locals)]
            msgs = ["-" * indent[0] + ">", event, frame.f_code.co_name, str(frame.f_locals)]
            log_trace(msgs)
        elif event == "return":
            #msgs = ["<" +  "-" * indent[0], "exit", frame.f_code.co_name, str(arg)]
            msgs = ["<" +  "-" * indent[0], event, frame.f_code.co_name, str(arg)]
            indent[0] -= 2
            log_trace(msgs)
        return tracefunc
    except:
        print traceback.format_exc()

def handle_trace(sig, frame):
    global DEBUG_MODE
    if DEBUG_MODE == False:
        sys.settrace(tracefunc)
        #threading.settrace(func)
        DEBUG_MODE = True
    else:
        sys.settrace(None)
        DEBUG_MODE = False

def trace_listen():
    signal.signal(signal.SIGUSR1, handle_trace)
    
