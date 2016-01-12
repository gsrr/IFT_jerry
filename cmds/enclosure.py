

def arith(op):
	def func(a, b):
		if op == "+":
			return a + b
		else:
			return a - b
		
	return func

add = arith("+")
print add(3,5)
sub = arith("-")
print sub(5,6)
