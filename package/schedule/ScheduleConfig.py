import os 
from ConfigTemplate import *
import xml.etree.ElementTree as ET
from xml.etree.ElementTree import Element
import xml
import copy

class ScheduleConfig(ConfigTemplate):

	def __init__ (self,serial):
		ConfigTemplate.__init__(self,serial)
		self.tree = ET.parse(self.getXMLPath('ScheduleConfig'))
		self.root = self.tree.getroot()
		self._initConfig()
		
	def _initConfig(self):
		tasks = self.root.findall("./task")
		for task in tasks:
			history = task.find("./history")
			if history == None:
				history = Element('history')
				date = ET.SubElement(history, 'date')
				result = ET.SubElement(history, 'result')
				date.text = "nope"
				result.text = "nope"
				task.append(history)

	def showConfig(self):
		pass
		
	def _set_daily(self, data,  paraList):
		pass

	def _set_weekly(self, data, paraList):
		data_d = data.find("./day")
		data_d.text = paraList['day']

	def _set_monthly(self, data, paraList):
		data_d = data.find("./day")
		data_d.text = paraList['day']
		data_m = data.find("./monthly/month")
		data_m.text = paraList['month']
		data_mod = data.find("./monthly/modifier")
		data_mod.text = paraList['modifier']

	def schedule_set_type(self, paraList):	
		type_map = {
			'daily' : self._set_daily,
			'weekly' : self._set_weekly,
			'monthly' : self._set_monthly,
		}
		xpath = "./task[@name='%s']/type"%paraList['name']
		data = self.root.find(xpath)
		data.attrib['type_mode'] = paraList['type']
		func = type_map[paraList['type']]
		func(data, paraList)

	def _schedule_set_period(self, data, paraList):
		data_p = data.find("period")
		data_p.find("value").text = paraList['period']
		if paraList['end_time']:
			data_p.attrib['period_mode'] = "0"
			data_e = data_p.find("end_time")
			data_e.text = paraList['end_time']
		else:
			data_p.attrib['period_mode'] = "1"
			data_e = data_p.find("duration")
			data_e.text = paraList['duration']


	def schedule_set_repeat(self, paraList):
		xpath = "./task[@name='%s']/repeat"%paraList['name']
		data = self.root.find(xpath)
		data.attrib['repeat_enable'] = paraList['repeat']
		if paraList['repeat'] == "off":
			return
		else:
			self._schedule_set_period(data, paraList)
		
	def schedule_update_startTime(self, paraList):
		xpath = "./task[@name='%s']/repeat"%paraList['name']
		repeat_enable = self.root.find(xpath).attrib['enable']
		pass
			
	def schedule_add(self, paraList):
		xpath = "./template"
		temp = self.root.find(xpath)
		data = copy.deepcopy(temp)
		data.tag = "task"
		data.attrib['name'] = paraList['name']
		data.attrib['category'] = paraList['category']
		data.attrib['sourceTask'] = paraList['sourceTask']
		self.root.append(data)
		for item in data:
			if item.tag == "status":
				item.text = paraList['status']
			if item.tag == "create_time":
				item.text = paraList['create_time']
			if item.tag == "description":
				item.text = paraList['description']
			if item.tag == "start_time":
				item.text = paraList['start_date'] + paraList['start_time']
			if item.tag == "end_time":
				item.attrib['etEnable'] = paraList['edt_enable']
				item.text = paraList['end_date'] + paraList['end_time']
			if item.tag == "type":
				item.attrib['mode'] = paraList['type']
				for sub in item:
					if sub.tag == "day":
						sub.text = paraList['day']
					if sub.tag == "period":
						sub.text = paraList['period']
		return {'status' : 0}
				
	def schedule_delete(self, paraList):
		xpath = "./task[@name='%s']"%paraList['name']
		data = self.root.find(xpath)
		self.root.remove(data)
		return {'status' : 0}
		
	def schedule_statusAll(self, paraList=None):
		ret = []
		xpath = "./task"
		data = self.root.findall(xpath)
		task = {}
		for item in data:
			task['name'] = item.attrib['name']
			task['sourceTask'] = item.attrib['sourceTask']
			task['category'] = item.attrib['category']
			task['status'] = item.find("./status").text
			task['createTime'] = item.find("./create_time").text
			task['startTime'] = item.find("./start_time").text
			task['etEnable'] = item.find("./end_time").attrib['etEnable']
			task['endTime'] = item.find("./end_time").text
			task['type'] = item.find("./type").attrib['mode']
			task['day'] = item.find("./type/day").text
			task['period'] = item.find("./type/period").text
			ret.append(copy.copy(task))

		return {'status' : 0, 'data' :ret}

	def schedule_status(self, paraList=None):
		task = {}
		xpath = "./task[@name='%s']"%(paraList['name'])
		data = self.root.find(xpath)
		if data == None:
			return {'status' : 0 ,  "data" : None}
		task['name'] = data.attrib['name']
		task['sourceTask'] = data.attrib['sourceTask']
		task['category'] = data.attrib['category']
		task['status'] = data.find("./status").text
		task['description'] = data.find("./description").text
		task['createTime'] = data.find("./create_time").text
		task['startTime'] = data.find("./start_time").text
		task['etEnable'] = data.find("./end_time").attrib['etEnable']
		task['endTime'] = data.find("./end_time").text
		task['type'] = data.find("./type").attrib['mode']
		task['day'] = data.find("./type/day").text
		task['period'] = data.find("./type/period").text
		return {'status' : 0, 'data':task}
	
	def schedule_list(self, paraList = None):
		xpath = "./task"
		tasks = []
		data = self.root.findall(xpath)
		for item in data:
			task = {}
			task['name'] = item.attrib['name']
			task['sourceTask'] = item.attrib['sourceTask']
			task['category'] = item.attrib['category']
			task['status'] = item.find("./status").text
			task['start_time'] = item.find("./start_time").text
			task['mode'] = item.find("./type").attrib['mode']
			task['day'] = item.find("./type/day").text
			task['period'] = item.find("./type/period").text
			task['etEnable'] = item.find("./end_time").attrib['etEnable']
			task['end_time'] = item.find("./end_time").text
			tasks.append(copy.deepcopy(task))
		return {'status' : 0, 'data' :tasks}

	def _browseAll(self, data, keys, paraList):
		if data.tag in keys:
			data.text = paraList[data.tag]
		for attr_key in data.keys():
			if attr_key in keys:
				data.attrib[attr_key] = paraList[attr_key]
			
		for item in data:
			xpath = "./" + item.tag
			self._browseAll(data.find(xpath), keys, paraList)

	def schedule_edit(self, paraList):
		xpath = "./task[@name='%s']"%paraList['old_name']
		data = self.root.find(xpath)
		keys = paraList.keys()
		self._browseAll(data, keys, paraList)
		return {'status' : 0}
		
	def schedule_sourceTask(self, paraList):
		xpath = "./task[@name='%s']"%paraList['name']
		data = self.root.find(xpath)
		return {'status' : 0, 'data' : [data.attrib['category'], data.attrib['sourceTask']]}

	def schedule_history_result(self, paraList):
		result = paraList['result']
		xpath = "./task[@sourceTask='%s']/history/result"%paraList['sourceTask']	
		history_result = self.root.find(xpath)
		history_result.text = result
		return {'status' : 0}

	def test(self):
		print "ScheduleConfig:Hello World"

def main(sys):
	x = ScheduleConfig('1234')
	print x.schedule_history_result({'result': 'In Progress', 'sourceTask': 'RR_20160815072940'})
	
if __name__ == "__main__":
	main(sys)
	
