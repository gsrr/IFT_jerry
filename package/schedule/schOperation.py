
import sys
import datetime
import traceback
import backupLib

sys.path.append("/usr/local/NAS/misc/agent/python/backup")
import eventAgent


TASKNONEXIST = 101

def errorMsg(ret):
	return backupLib.errorMsg(ret)

def updateCronDaemon(HAServer, paraList):
	paras = {}
	paras['op'] = "updateDaemon"
	paras['controller'] = paraList['controller']
	paras['serviceId'] = "0"
	HAServer.callGetLocalFunc("cronOperation", paras)
	
	
@backupLib.nameInspection("Schedule")
def delete(HAServer, paraList):
	ret = HAServer.setConfig("ScheduleConfig", "schedule_delete", paraList)
	updateCronDaemon(HAServer, paraList)
	return {'status' : 0}

def isTaskExist(HAServer, paraList):
	task_type = paraList['type']
	task = HAServer.getConfig("RRConfig", "rr_status", {'name' : paraList['sourceTask']})['data']
	if task == None:
		return {'status' : TASKNONEXIST}
	return {'status' : 0}		

def add(HAServer, paraList):
	s_ret = isTaskExist(HAServer, paraList)
	if s_ret['status'] != 0:
		return s_ret
	HAServer.setConfig("ScheduleConfig", "schedule_add", paraList)
	HAServer.log(1, "start to update cron")
	updateCronDaemon(HAServer, paraList)
	return {'status' : 0}	

def statusAll(HAServer, paraList):
	ret = HAServer.getConfig("ScheduleConfig", "schedule_statusAll", paraList)
	return ret

@backupLib.nameInspection("Schedule")
def status(HAServer, paraList):
	ret = HAServer.getConfig("ScheduleConfig", "schedule_status", paraList)
	return ret
	
def edit(HAServer, paraList):
	ret = HAServer.setConfig("ScheduleConfig", "schedule_edit", paraList)
	updateCronDaemon(HAServer, paraList)
	return {'status' : 0}

def setHistoryResult(HAServer, paraList):
	ret = HAServer.setConfig("ScheduleConfig", "schedule_history_result", paraList)
	return ret
	
#{'controller': 'A', 'name': 'New_Schedule_20160527_170754', 'op': 'run'}
def run(HAServer, paraList):
	source_task = HAServer.getConfig("ScheduleConfig", "schedule_sourceTask", paraList)['data']
	if source_task[0] == "RR":
		HAServer.log(1, "start schedule RR task!!")
		paras = {
			'op' : 'startRR',
			'name' : source_task[1],
			'controller' : HAServer.getCurrentController(),
		}
		ret = HAServer.callGetLocalFunc("RROperation", paras)
		eventAgent.writeEvent(HAServer, {'op' : 'sch_start', 'ret' : ret, 'name' : paraList['name']})
		return ret

def schOperation(HAServer, paraList):
	try:
		op = paraList['op']
		func = getattr(sys.modules[__name__], op)
		return func(HAServer, paraList)
	except:
		return {'status' : -999, 'exception' : traceback.format_exc()}

def main():
	pass

if __name__ == "__main__":
	main()
