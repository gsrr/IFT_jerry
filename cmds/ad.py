import sys
import os
import commands
import re

def split(line):
	arr = line.split("=")
	return arr[0].strip(), arr[1].strip()

def readConfig(filepath):
	cfg = {}	
	with open(filepath, "r") as fr:
		lines = fr.readlines()
		for line in lines:
			key, value = split(line)
			cfg[key] = value
	return cfg

def ip_check(ip):
	print "check ip connection"
	os.system("ping -c 5 %s "%ip)

def dnsname_check(ip):
	cmd = "/usr/bin/ldapsearch -h %s -p 389 -LLL -o ldif-wrap=no -x -s base objectclass=* defaultNamingContext"%ip
	lines = commands.getoutput(cmd).splitlines()
	sobj = re.search(r'defaultNamingContext:(.*)', lines[1])
	dnslist = sobj.group(1).split(",")
	ret = ""
	for dns in dnslist:
		ret += dns.split("=")[1]
		ret += "."
	return ret.strip(".")

def testAD():
	cfg = readConfig("ad.config")	
	#ip_check(cfg['ip'])
	cfg['dnsname'] = dnsname_check(cfg['ip'])
	print cfg

def main():
	getattr(sys.modules[__name__], sys.argv[1])()

if __name__ == "__main__":
	main()
