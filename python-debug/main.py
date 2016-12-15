import os
import hello

def test_os():
    print os.path.exists("/root")

def main():
    hello.hello()

if __name__ == "__main__":
    main()
