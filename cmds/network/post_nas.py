#!/usr/bin/env python
#coding=utf8

import httplib, urllib

httpClient = None
try:
	headers = '''
		Content-Type:application/x-www-form-urlencoded
		Cookie:JSESSIONID=5B4554A26442E3D585535D3DCBE58758
	'''

	params = '''
		foldername:test_python
		path:/Pool-1/123
	'''

	headers = dict([line.strip().split(":") for line in headers.strip().split("\n")])
	params = dict([line.strip().split(":") for line in params.strip().split("\n")])
	params = urllib.urlencode(params)

	httpClient = httplib.HTTPConnection("172.27.113.43", 80, timeout=30)
	httpClient.request("POST", "/servlet/FileCreate", params, headers)
	response = httpClient.getresponse()
	print response.status
	print response.reason
	print response.read()
	print response.getheaders() 

except Exception, e:
	print e

finally:
	if httpClient:
		httpClient.close()
