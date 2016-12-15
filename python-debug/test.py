import time

code1 = """
def loop():
    cnt = 0
    while True:
        print "11111111111111"
        print cnt
        cnt += 1
        time.sleep(1)
        main.main()
        print "----------------"
"""

code2 = """
while True:
    print 'hello world'
    time.sleep(1)
"""

def main():
    exec(code2)

if __name__ == "__main__":
    main()
