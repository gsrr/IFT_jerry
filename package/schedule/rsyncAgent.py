import os, sys, time,traceback
import commands
import subprocess
import fcntl
import json
import time

sys.path.append("/usr/local/NAS/misc/HAAgent/")
from NASHAComm import *

sys.path.append("/usr/local/NAS/misc/agent/python/backup")
import eventAgent

PERM_DENY = 1002
QUOTA_EXCEED = 1003
IP_ERROR = 1004
SRC_IPERROR = 1005
IP_FORMATERROR = 1006
MODULEERROR = 1007
IN_PROGRESS = 1008
LOCALBLOCKBYSHELL = 1009
PATHERROR = 1010


def checkPid(pid):
	try:
		os.kill(pid, 0)
	except OSError:
		return False
	return True
	
def log(message) : 
	timeString = time.ctime(time.time())
	fPtr = open("/var/log/NAS_rsync_python_schedule.log","a+")
	fPtr.write("[%s] => %s\n" % (timeString, message))
	fPtr.close()

def restoreRR(cmds):
	startRR(cmds)

def runRR(cmd):
	proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
	line = proc.stdout.readline()
	while line:
		line = line.strip()
		if "rsync error: timeout" in line:
			return {"status" : 1001}
		elif "Permission denied," in line or "Permission denied" in line:
			return {"status" : PERM_DENY}
		elif "No space left on device" in line:
			return {"status" : QUOTA_EXCEED }
		elif "Connection refused" in line:
			return {"status" : IP_ERROR }
		elif "Cannot assign requested address" in line:
			return {"status" : SRC_IPERROR }
		elif "Name or service not known" in line:
			return {"status" : IP_FORMATERROR }
		elif "auth failed" in line:
			return {"status" : PERM_DENY}
		elif "Unknown module" in line:
			return {'status' : MODULEERROR}
		elif "connection unexpectedly closed" in line:
			return {'status' : LOCALBLOCKBYSHELL}
		elif "error starting client-server protocol" in line:
			return {'status' : PATHERROR}
			
		line = proc.stdout.readline()
		log(line.strip())
			
	return {"status" : 0}

def stopNetService():
	try:
		localHA = NASHAComm("127.0.0.1")
		paraList = {}
		paraList['op'] = "stopNetService"
		localHA.callGetLocalFunc("RROperation", paraList)
	except:
		pass	
	finally:
		localHA.closeSocket()

def setHistoryResult(paraList):
	try:
		localHA = NASHAComm("127.0.0.1")
		name = paraList['expfile'].split("/")[2].rstrip(".exp")
		paras = {
			'op' : 'setHistoryResult',
			'sourceTask' : name,
			'controller' : localHA.getCurrentController(),
		}
		status = paraList.get('status')
		if status == None:
			paras['result'] = "In Progress"
		else:
			if status == 0:
				paras['result'] = "Success"
			else:
				paras['result'] = "Fail"
		print paras
		ret = localHA.callGetLocalFunc("schOperation", paras)
		print "setConfig:", ret
	except:
		log("set result:%s"%(traceback.format_exc()))
	finally:
		localHA.closeSocket()

def writeEvent(expfile, ret):
	localHA = None
	try:
		name = expfile.split("/")[2].rstrip(".exp")
		localHA = NASHAComm("127.0.0.1")
		setHistoryResult({'status' : ret['status'], 'expfile' : expfile})	
		cfg = localHA.getConfig("RRConfig", "rr_get_task", {'name' : name})['data']
		if ret['status'] == 0:
			eventAgent.writeEvent(localHA, {'op' : 'runRR', 'name' : name, 'ip' : cfg['ip'], 'ret' : ret})	
		else:
			if ret['status'] == QUOTA_EXCEED:
				eventAgent.writeEvent(localHA, {'op' : 'RRquota', 'name' : name, 'ret' : ret})	
			elif ret['status'] == IN_PROGRESS:
				eventAgent.writeEvent(localHA, {'op' : 'RRinprogress', 'name' : name, 'ret' : ret})	
			elif ret['status'] == PERM_DENY:
				eventAgent.writeEvent(localHA, {'op' : 'RRperm', 'name' : name, 'ret' : ret})	
			elif ret['status'] == LOCALBLOCKBYSHELL:
				eventAgent.writeEvent(localHA, {'op' : 'runRR', 'name' : name, 'ip' : cfg['ip'], 'ret' : ret})	
			elif ret['status'] == IP_ERROR:
				eventAgent.writeEvent(localHA, {'op' : 'RRip', 'name' : name, 'ip' : cfg['ip'], 'ret' : ret})	
			elif ret['status'] == PATHERROR:
				eventAgent.writeEvent(localHA, {'op' : 'RRpath', 'name' : name, 'ret' : ret, 'cfg' : cfg})	
			else:
				eventAgent.writeEvent(localHA, {'op' : 'runRR', 'name' : name, 'ip' : cfg['ip'], 'ret' : ret})	
	except:
		print traceback.format_exc()
		pass
	finally:
		localHA.closeSocket()
	
def isRunning(expfile):
	cmd = "ps -ef | grep %s | grep -v grep"%expfile
	out = commands.getoutput(cmd).splitlines()
	if len(out) > 1:
		return True
	return False

def startRR(cmds):
	cmd = "/usr/bin/expect %s"%cmds[1]
	if isRunning(cmds[1]):
		ret = {'status' : IN_PROGRESS}
		writeEvent(cmds[1], ret)
		return ret
		 
	stopNetService()
	retry = int(cmds[2])
	interval = int(cmds[3])
	for i in range(retry):
		setHistoryResult({'expfile' : cmds[1]})	
		ret = runRR(cmd)
		writeEvent(cmds[1], ret)
		if ret['status'] == 0:
			break
		time.sleep(interval)
	return ret

def testRR(cmds):
	cmd = "/usr/bin/expect %s"%cmds[1]
	return runRR(cmd)
		

if __name__ == '__main__':
	try:
		op = sys.argv[1]
		expfile = sys.argv[2]
		func = getattr(sys.modules[__name__], op)
		ret = func(sys.argv[1:])
		print json.dumps(ret)
	except:
		print traceback.format_exc()
	finally:
		#os.system("rm -rf %s"%expfile)
		sys.exit(0)
