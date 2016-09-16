import unittest
import xml.etree.ElementTree as ET
import subprocess

iftname2path = {
	'schedule' : '/cfpool/ScheduleConfig_*.xml',
}

def getIFTXmlPath(name):
	cmd = 'ls %s'%(iftname2path[name])
	proc = subprocess.Popen(cmd, shell = True, stdout=subprocess.PIPE)
	path = proc.stdout.readline().strip()
	return path

def readXml(path, func):
	tree = ET.parse(func(path))
	root = tree.getroot()
	return root

class TestSchedule(unittest.TestCase):
	def setUp(self):
		pass
	
	def test_schedule_history(self):
		'''
		All cfg in xml should have tag named history.
		'''
		root = readXml('schedule', getIFTXmlPath)
		tasks = root.findall("./task")
		for task in tasks:
			print task.attrib['name']
			for history in task.find('./history'):
				print history.tag, history.text
		

	def tearDown(self):
		pass

def suite():
	print "suite test"
	tests = ['test_hello2', 'test_hello1']
	suite = unittest.TestSuite(map(TestSchedule, tests))
	unittest.TextTestRunner(verbosity=2).run(suite)


if __name__ == "__main__":
	unittest.main()
