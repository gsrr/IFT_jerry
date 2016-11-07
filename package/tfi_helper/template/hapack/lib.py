import traceback
import sys
import os
import subprocess

def [module_name]_test_lib(HAServer, paraList):
    return {'status' : 0 , 'data' : "call lib successfully"}
    
def [module_name]Lib(HAServer, paraList):
	try:
		op = paraList['op']
		func = getattr(sys.modules[__name__], op)
		return func(HAServer, paraList)
	except:
		return {'status' : -999, 'exception' : traceback.format_exc()}

if __name__ == "__main__":
	try:
		sys.path.append("/usr/local/NAS/misc/HAAgent")
		from NASHAComm import *
		HA = NASHAComm("127.0.0.1")
		func = getattr(sys.modules[__name__], sys.argv[1])	
		func(HA)
	except:
		pass
	finally:
		HA.closeSocket()
		
