
import xml.etree.ElementTree as ET
from xml.etree.ElementTree import Element

tree = ET.parse("ScheduleConfig_3434.xml")
root = tree.getroot()
tasks = root.findall("./task")
for task in tasks:
	history = task.find("./history")
	if history == None:
		history = Element('history')
		date = ET.SubElement(history, 'date')
		result = ET.SubElement(history, 'result')
		date.text = "nope"
		result.text = "nope"
		task.append(history)

tree.write("output.xml")
