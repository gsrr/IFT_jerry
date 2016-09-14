import sys
import trace
import hello


def tracefunc(frame, event, arg, indent=[0]):
    print event
    if event == "call":
        indent[0] += 2
        print "-" * indent[0] + "> call function", frame.f_code.co_name
    elif event == "return":
        print "<" + "-" * indent[0], "exit function", frame.f_code.co_name
        indent[0] -= 2
    return tracefunc

import sys
sys.settrace(tracefunc)

tracer = trace.Trace()
tracer.run('hello.main()')
#hello.main()
'''
# do tracing or line-counting or both.
tracer = trace.Trace(
    trace=0)

# run the new command using the given tracer
tracer.run('hello.main()')
'''
