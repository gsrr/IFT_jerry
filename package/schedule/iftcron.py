#!/usr/bin/env python3
# daemon.py

#!/usr/bin/env python

import sys, os, time
from Queue import Queue
import heapq
import threading
import datetime
import traceback

sys.path.append("/usr/local/NAS/misc/HAAgent")
sys.path.append("/usr/local/NAS/misc/HAAgent/Info")
from HADefine import *
from NASHAComm import *
import HAServer
import copy

def cronlog(msg):
	try:
		fd = open("/var/log/iftcron.log", "a")
		fd.write("[" + time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time())) + "] ")
		fd.write("%s"%(msg))
		fd.write("\n")
		fd.close()	
	except:
		print '[CronDaemon.log] exception: %s' % traceback.format_exc()

def setHistoryDate(HAServer, config):
	paras = {
		'old_name' : config['name'],
		'date' : config['history_date'] ,
	}
	HAServer.setConfig("ScheduleConfig", "schedule_edit", paras)

def scheduleStatus(ha, config):
	cronlog("(name,status):(%s, %s)"%(config.get('name'), config.get('status')))
	if config.get('status') == 'off':
		return False
	else:
		if config.get("etEnable") == "on":
			now = datetime.datetime.now()
			end_time = datetime.datetime.strptime(config['end_time'], '%Y%m%d%H%M')
			if end_time < now:
				paraList = {
					'op' : 'edit',
					'old_name' : config['name'],
					'status' : "off" ,
					'controller' : ha.getPrimaryController()
				}
				ret = ha.callGetLocalFunc("schOperation", paraList)
				cronlog("(now:end) = (%s:%s):%s"%(now, end_time, str(ret)))
				return False
				
	return True
	
	
def daily_updateTime(now, config):
	start = datetime.datetime.strptime(config['start_time'], '%Y%m%d%H%M')
	next = None
	if start < now:
		next = datetime.datetime(now.year, now.month, now.day, start.hour, start.minute, 0)
	else:
		next = start
	if next < now:
		next = next + datetime.timedelta(days=1)

	config['start_time'] = "%04d%02d%02d%02d%02d"%(next.year, next.month, next.day, next.hour, next.minute)

def weekly_updateTime(now, config):
	start = datetime.datetime.strptime(config['start_time'], '%Y%m%d%H%M')
	cronlog("weekly update time:(now, start)=(%s, %s)"%(str(now), str(start)))
	temp_next = start
	if start < now:
		temp_next = datetime.datetime(now.year, now.month, now.day, start.hour, start.minute, 0)
	
	add_days = []	#max value of week
	temp_add_days = []
	config_days = config['day'].split(",")
	for config_day in config_days:
		temp_add_days.append((int(config_day) - 1 - temp_next.weekday()) % 7)

	add_days = sorted(temp_add_days)
	for day in add_days:
		temp_next = temp_next + datetime.timedelta(days = day)
		if temp_next > now:
			break

	if temp_next < now:
		temp_next = temp_next + datetime.timedelta(days = 7)
	
	config['start_time'] = "%04d%02d%02d%02d%02d"%(temp_next.year, temp_next.month, temp_next.day, temp_next.hour, temp_next.minute)
		
def nextMonthDay(cnt, now, start_time, config):
	months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
	days = config['day'].split(",")
	next = None
	try:
		for month in months:
			if cnt == 0 and int(month) < int(start_time.month): # same year
				continue
			for day in days:
				if cnt == 0 and int(month) == int(start_time.month) and int(day) < int(start_time.day):
					continue	
				try:
					next = datetime.datetime(start_time.year + cnt, int(month), int(day), start_time.hour, start_time.minute, 0)
					cronlog("update monthly::(name, next, previous, current) = (%s, %s, %s, %s)"%(config['name'], str(next), str(start_time), str(now)))
					if next >= start_time:
						if next > now:
							return next
						else:
							next = None
				except:
					pass
	except:
		cronlog("update monthly::exception = %s"%(traceback.format_exc()))
		print traceback.format_exc()
	return next

def nextMonthWeekday(cnt, now, config):
	start_time = datetime.datetime.strptime(config['start_time'], '%Y%m%d%H%M')
	months = config['month'].split(",")	
	modifier = config['modifier']
	next = None
	for month in months:
		try:
			next = datetime.datetime(now.year + cnt, int(month), 1, start_time.hour, start_time.minute, 0)
			#get first weekday
			add_days = (int(config['day']) - 1 - next.weekday()) % 7
			next = next + datetime.timedelta(days = add_days)
			shift = int(modifier) - 1
			next = next + datetime.timedelta(days = (7 * shift))	
			if next > now:
				break
		except:
			print traceback.format_exc()
	return next
	
def monthly_updateTime(now, config):
	cnt = 0
	next = None
	timeFunc = nextMonthDay
	start_time = datetime.datetime.strptime(config['start_time'], '%Y%m%d%H%M')
	if start_time < now:
		start_time = datetime.datetime(now.year, now.month, now.day, start_time.hour, start_time.minute, 0)
	next = timeFunc(cnt, now, start_time, config)
	while next == None:
		cnt += 1
		next = timeFunc(cnt, now, start_time, config)

	config['start_time'] = "%04d%02d%02d%02d%02d"%(next.year, next.month, next.day, next.hour, next.minute)
	return next

def every_updateTime(now, config):
	cronlog("every_updatetime:here")
	try:
		period = config['period']
		hour = 0
		minute = 0
		if period[2] == "h":
			hour += int(period[0:2])
		if period[2] == "m":
			minute += int(period[0:2])
		
		start = datetime.datetime.strptime(config['start_time'], '%Y%m%d%H%M')
		if start < now:
			start = datetime.datetime(now.year, now.month , now.day, start.hour, start.minute, 0)

		while start <= now:
			start = start + datetime.timedelta(hours = hour)
			start = start + datetime.timedelta(minutes = minute)
		config['start_time'] = "%04d%02d%02d%02d%02d"%(start.year, start.month, start.day, start.hour, start.minute)
	except:
		cronlog(str(traceback.format_exc()))
	
	
def updateScheduleTime(now, config):
	try:
		mode = config['mode']
		cronlog("[update schedule time] = " + mode + "_updateTime")
		func = getattr(sys.modules[__name__], mode + "_updateTime")
		config['history_date'] = config['start_time']
		func(now, config)
		'''
		paraList = {
			'old_name' : sch_config['name'],
			'status' : "disable" ,
		}
		self._haserver.setConfig("ScheduleConfig", "schedule_edit", paraList)
		'''
	except:
		print traceback.format_exc()
	finally:
		return config['start_time']


def errorTimestamp(now, timestamp):
	if timestamp == None:
		return True

	if timestamp > now:
		return True
	
	if (now - timestamp) > datetime.timedelta(seconds=61):
		print "time stamp too big"
		return False

	return False
	
class SharedCounter:
	def __init__(self, initial_value = 0, max = 1):
		self._value = initial_value
		self._max = max
		self._value_lock = threading.Lock()

	def incr(self,delta=1):
		with self._value_lock:
			crt_value = self._value
			self._value += delta
			self._value = self._value % self._max
			return crt_value

class RandomAccessQueue:
	def __init__(self):
		self._queue = []
		self._cv = threading.Condition()
		
	def put(self, item):
		with self._cv:
			self._queue.append(item)
			self._cv.notify()
			
	def get(self, block=True):
		with self._cv:
			while len(self._queue) == 0 and block == True:
				self._cv.wait()
					
			return self._queue.pop(0) if len(self._queue) > 0 else None
			
	def contains(self, item):
		with self._cv:
			#print '[RandomAccessQueue.contains][msg] item:%s, queue:%s, in:%s' % (item, self._queue, item in self._queue)
			return item in self._queue
		
	def remove(self, item):
		with self._cv:
			#print '[RandomAccessQueue.remove][msg] item:%s, queue:%s, in:%s' % (item, self._queue, item in self._queue)
			if item in self._queue:
				return self._queue.pop(self._queue.index(item))
		return None

class ActorExit(Exception):
	pass

class Actor:
	def __init__(self):
		self._mailbox = Queue()
		
	def send(self, msg):
		'''
		Send a message to the actor
		'''
		self._mailbox.put(msg)
		
	def recv(self):
		'''
		Receive an incoming message
		'''
		msg = self._mailbox.get()
		if msg is ActorExit:
			raise ActorExit()
		return msg
		
	def close(self):
		'''
		Close the actor, thus shutting it down
		'''
		self.send(ActorExit)
		
	def start(self):
		'''
		Start concurrent execution
		'''
		self._terminated = threading.Event()
		t = threading.Thread(target=self._bootstrap)
		t.daemon = True
		t.start()
		
	def _bootstrap(self):
		try:
			self.run()
		except ActorExit:
			pass
		finally:
			self._terminated.set()
			
	def join(self):
		self._terminated.wait()
		
	def run(self):
		'''
		Run method to be implemented by the user
		'''
		while True:
			msg = self.recv()
	
class MinuteTimer:

	INTERVAL_SECOND = 5
	
	def __init__(self):
		self._subscribers = set()
		
	def attach(self, task):
		self._subscribers.add(task)
		
	def detach(self, task):
		self._subscribers.remove(task)
		
	def start(self):
		self._terminated = threading.Event()
		self._running = threading.Event()
		t = threading.Thread(target=self.run)
		t.daemon = True
		t.start()
		
	def run(self):
		'''
		Run the timer and notify waiting threads after each interval
		'''
		#print '[MinuteTimer.run] enter'
		try:
			while not self._running.is_set():
				now = datetime.datetime.now()
				offset = 60 - now.second
				sleep_time = min(offset, MinuteTimer.INTERVAL_SECOND)
				time.sleep(sleep_time)
				if self._running.is_set():
					break
				if sleep_time == offset:
					self.tick()
		except:
			print '[MinuteTimer.run] exception: %s' % traceback.format_exc()
		finally:
			self._terminated.set()
		
	def tick(self):
		now = datetime.datetime.now()
		for subscriber in self._subscribers:
			subscriber(now)
		
	def close(self):
		try:
			self._running.set()
		except:
			print '[MinuteTimer.close] exception: %s' % traceback.format_exc()
		
	def join(self):
		try:
			self._terminated.wait()
		except:
			print '[MinuteTimer.join] exception: %s' % traceback.format_exc()
		
class InfoUpdater(Actor):
	def __init__(self, HAServer):
		Actor.__init__(self)
		self._waiting_queue = RandomAccessQueue()
		self._info_semaphores = {'SnapshotInfo': threading.Semaphore(1) }
		self._haserver = HAServer
		self._local = threading.local()

	def run(self):
		cronlog('[InfoUpdater.run] enter')
		try:
			while True:
				msg = self.recv()
				cronlog('[InfoUpdater.run] received:%s' % (msg))
				if not self._waiting_queue.contains(msg):
					cronlog('[InfoUpdater.run][%s] put info into waiting queue' % (msg))
					self._waiting_queue.put(msg)
					t = threading.Thread(target=self.update_info, args=(msg, ))
					t.start()
				else:
					cronlog('[InfoUpdater.run][%s] msg is already waiting' % (msg))
		except ActorExit:
			cronlog('[InfoUpdater.run] exception: ActorExit')
			raise
		except:
			cronlog('[InfoUpdater.run] exception: %s' % traceback.format_exc(), logLvl=1)
			
	def update_info(self, msg):
		self._local.start_time = datetime.datetime.now()
		info_name = msg
		cronlog('[InfoUpdater.update_info][%s] enter: %s' % (msg, self._local.start_time))
		try:
			cronlog('[InfoUpdater.update_info][%s] waiting queue:%s' % (msg, len(self._waiting_queue._queue)))
			cronlog('[InfoUpdater.update_info][%s] wait for semaphore' % (msg))
			with self._info_semaphores[msg]:
				self._waiting_queue.remove(msg)
				cronlog('[InfoUpdater.update_info][%s] update local info' % (msg), logLvl=1)
				self._haserver.updateLocalInfo(msg)
				if self._haserver.isPrimaryController() and self._haserver.getFailMode() == 0:
					cronlog('[InfoUpdater.update_info][%s] update remote info' % (msg), logLvl=1)
					self._haserver.updateRemoteInfo(msg, timeout=86400)
					cronlog('[InfoUpdater.update_info][%s] update remote info finished' % (msg), logLvl=1)
		except:
			cronlog('[InfoUpdater.update_info][%s] exception: %s' % (msg, traceback.format_exc()), logLvl=1)
		finally:
			self._local.end_time = datetime.datetime.now()
			cronlog('[InfoUpdater.update_info][%s] exit: %s, cost: %s' % (msg, self._local.end_time, self._local.end_time-self._local.start_time))
			
class CronJobRunner(Actor):

	THREAD_POOL_LIMIT = 100
	
	def __init__(self, HAServer, info_updater):
		Actor.__init__(self)
		self._waiting_queue = RandomAccessQueue()
		self._running_queue = RandomAccessQueue()
		self._haserver = HAServer
		self._info_updater = info_updater
		self._worker_semaphore = threading.Semaphore(CronJobRunner.THREAD_POOL_LIMIT)
		self._log_level = 2
		self._local = threading.local()
		self._job_list = {}
		self._worker_counter = SharedCounter(max=CronJobRunner.THREAD_POOL_LIMIT)
				
	def run(self):
		try:
			while True:
				type, config = self.recv()
				sch_name = config['name']
				cronlog('[CronJobRunner.start to run] schedule name: %s' % ( sch_name ))
				if type == "run":
					self._job_list[sch_name] = config
					t = threading.Thread(target=self.run_schedule, args=(sch_name,))
					t.start()
					setHistoryDate(self._haserver, config)
				elif type == "remove":
					cronlog('[CronJobRunner.run][%s] waiting queue:%s' % (sch_name, self._waiting_queue._queue))
					if self._waiting_queue.contains(sch_name):
						cronlog('[CronJobRunner.run][%s] remove msg from waiting queue' % (sch_name))
						self._waiting_queue.remove(sch_name)
						cronlog('[CronJobRunner.run][%s] renewed waiting queue:%s' % (sch_name, self._waiting_queue._queue))						
					else:
						cronlog('[CronJobRunner.run][%s] msg is not in the waiting queue' % (sch_name))
				else:
					cronlog('[CronJobRunner.run][%s] unknown command' % (sch_name))
		except ActorExit:
			#cronlog('[CronJobRunner.run] exception: ActorExit')
			raise
		except:
			cronlog('[CronJobRunner.run] exception: %s' % (traceback.format_exc()))
			
	def run_schedule(self, sch_name):
		try:
			cronlog('[CronJobRunner.run_schedule] schedule name: %s' % ( sch_name ))
			config = self._job_list.get(sch_name)
			del self._job_list[sch_name]
			ret = self._haserver.callGetLocalFunc('schOperation', {'op':'run', 'name':sch_name, 'controller':self._haserver.getPrimaryController()})
		except:
			cronlog('[CronJobRunner.run_schedule] exception: %s' % (traceback.format_exc()))
			
	
class CronDaemon(Actor):
	def __init__(self, HAServer):
		Actor.__init__(self)
		self._haserver = HAServer
		self._schedule_list = {}
		self._timestamp = None
		self._log_level = 2
		
		'''
		The actor to receive messages and call
		HAServer to update info.
		'''
		self._info_updater = InfoUpdater(HAServer)
		
		'''
		The actor to receive messages and call
		HAServer to execute msg.
		'''
		self._worker = CronJobRunner(HAServer, self._info_updater)
		
		'''
		The timer to trigger scheduler every minute
		When time is up, timer will trigger every handler attached to it.
		'''
		self._timer = MinuteTimer()
		self._timer.attach(self.tick)

	def tick(self, msg):
		try:
			self.send(('tick', msg))
		except:
			cronlog('[CronDaemon.tick] exception: %s' % traceback.format_exc())
		
	def do_tick(self):
		try:
			needRefresh = False
			now = datetime.datetime.now()
			
			if errorTimestamp(now, self._timestamp) == True:
				needRefresh = True
			cronlog('[CronDaemon.do_tick] refresh: %s' % (needRefresh))
		
			self._timestamp = now
			
			if needRefresh == True:
				self.do_refresh()
			else:
				self.do_execute_schedules()	
		except:
			cronlog('[CronDaemon.do_tick] exception: %s' % traceback.format_exc())
		
	def refresh(self, msg):
		try:
			self.send(('refresh', msg))
		except:
			cronlog('[CronDaemon.refresh] exception: %s' % traceback.format_exc())
	
	def do_refresh(self):
		try:
			old_schedule_list = copy.deepcopy(self._schedule_list)
			self._schedule_list = self._haserver.getConfig('ScheduleConfig', 'schedule_list', {})['data']
			
			for sch_config in self._schedule_list:
				if scheduleStatus(self._haserver, sch_config) == True:
					self.do_update_executing_time(sch_config)
		except:
			cronlog('[CronDaemon.do_refresh] exception: %s' % traceback.format_exc())
	
	def do_update_executing_time(self, sch_config):
		try:
			now = datetime.datetime.now()
			now = datetime.datetime(now.year, now.month, now.day, now.hour, now.minute, 0) + datetime.timedelta(minutes=1)
			updateScheduleTime(now, sch_config)
			paraList = {
				'old_name' : sch_config['name'],
				'start_time' : sch_config['start_time'],
			}
			self._haserver.setConfig("ScheduleConfig", "schedule_edit", paraList)
		except:
			cronlog('[CronDaemon.do_update_executing_time][%s] exception: %s' % (sch_config['name'], traceback.format_exc()))
	
	def do_execute_schedules(self):
		try:
			now = datetime.datetime.now()
			now_str = now.strftime("%Y%m%d%H%M")
			for sch_config in self._schedule_list:
				if scheduleStatus(self._haserver, sch_config) == True:
					start_str = sch_config.get('start_time')
					cronlog("[Schedule:%s, type:%s, startTime:%s, nowTime:%s]"%(sch_config['name'], sch_config['mode'], start_str, now_str))
					if start_str < now_str:
						self.do_update_executing_time(sch_config)
					elif start_str == now_str:
						cronlog('[CronDaemon.do_execute_schedules][%s] keep runnung' % (sch_config['name']))
						self._worker.send(('run', sch_config))
						self.do_update_executing_time(sch_config)
					else:
						cronlog('[CronDaemon.do_execute_schedules][%s] keep waiting' % (sch_config['name']))
		except:
			cronlog('[CronDaemon.do_execute_schedules] exception: %s' % traceback.format_exc())
	
	def start(self):
		self.do_tick()
		self._info_updater.start()
		self._worker.start()
		self._timer.start()
		Actor.start(self)
	
	def run(self):
		cronlog('[CronDaemon.run] enter')
		try:
			while True:
				type, msg = self.recv()
				if type == "tick":
					self.do_tick()
				elif type == "refresh":
					self.do_refresh()
				else:
					cronlog('[CronDaemon.run] unknown command')
		except ActorExit:
			#cronlog('[CronDaemon.run] exception: ActorExit')
			raise
		except:
			cronlog('[CronDaemon.run] exception: %s' % traceback.format_exc())
		finally:
			cronlog('[CronDaemon.run] exit')
		
	def close(self):
		self._timer.close()
		self._worker.close()
		self._info_updater.close()
		Actor.close(self)
		
	def join(self):
		self._timer.join()
		self._worker.join()
		self._info_updater.join()
		Actor.join(self)
	
	def test(self):
		for sch_config in self._schedule_list:
			self._worker.send(('run', sch_config))
			
def echo(msg):
	print '[echo] msg: %s' % (msg)
		
if __name__ == '__main__': 
	localHA = NASHAComm(LOCAL_HA_IP)
	schInfo = localHA.getConfig("ScheduleConfig", "schedule_statusAll")
	cdaemon = CronDaemon(localHA)
	cdaemon.start()
	cdaemon.join()
	localHA.closeSocket()
	

	
