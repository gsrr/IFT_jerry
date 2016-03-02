import ast
import sys


def main(filename):
	tree = ast.parse(open(filename, "rt").read())
	for f in tree.body:
		if isinstance(f, ast.FunctionDef):
			print "\t%s"%f.name

if __name__ == "__main__":
	filename = sys.argv[1]
	print(filename)
	main(filename)
