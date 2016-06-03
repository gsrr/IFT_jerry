
import sys

def hello2():
	return "Hello World2\n"

def hello():
	return "Hello World\n"

def main(name):
	func = getattr(sys.modules[__name__], name)
	return func()

if __name__ == "__main__":
	main(sys.argv[1])
