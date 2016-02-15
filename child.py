

import os
import sys
import base64
import traceback


def _key_operation(func):
	def warp_func():
		msg = {
			'key_recover' : "Please input your key string:",
			'key_generate' : "Please input your string:",
		}
		text = raw_input(msg[func.__name__])
		cnt = 3
		i = 0
		while i < cnt:
			temp = func(text)
			text = temp
			i += 1
		print text
		return text
	return warp_func

@_key_operation
def key_recover(text):
	return base64.b64decode(text)
		
@_key_operation
def key_generate(text):
	return base64.b64encode(text)

def thanks():
	print "You are welcome!"

def exit():
	print "bye bye"
	os._exit(0)

def main():
	while True:
		try:
			msg = raw_input("Hi>> ")
			act = getattr(sys.modules[__name__], msg.replace(" ", "_"))
			act()
		except:
			print "I don't understand your message."
			#print traceback.format_exc()

if __name__ == "__main__":
	main()
