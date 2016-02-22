#!/usr/bin/env python
#coding=utf8

import httplib, urllib

httpClient = None
try:
	headers = '''
		Content-Type:application/x-www-form-urlencoded
		Cookie:JSESSIONID=5B4554A26442E3D585535D3DCBE58758
	'''
	headers = '''
		Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
		Accept-Encoding:gzip, deflate
		Accept-Language:en-US,en;q=0.8,zh-TW;q=0.6,zh;q=0.4
		Cache-Control:max-age=0
		Connection:keep-alive
		Content-Length:144
		Content-Type:application/x-www-form-urlencoded
		Cookie:JSESSIONID=74a37f27bd91a0a20a68253fabb2
		Host:gcis.nat.gov.tw
		Origin:http://gcis.nat.gov.tw
		Referer:http://gcis.nat.gov.tw/pub/cmpy/cmpyInfoListAction.do
		Upgrade-Insecure-Requests:1
		User-Agent:Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
	'''

	params = '''
		foldername:test_python
		path:/Pool-1/123
	'''

	params = '''
		method:query
		otherEnterFlag:false
		useEUC:N
		isShowEUC:N
		queryKey:sed7014
		selCmpyType:1
		selQueryType:2
		queryStr:04541302
		brBanNo:
		imageCode:328269
	'''

	headers = dict([line.strip().split(":",1) for line in headers.strip().split("\n")])
	params = dict([line.strip().split(":",1) for line in params.strip().split("\n")])
	print headers
	print params
	params = urllib.urlencode(params)

	httpClient = httplib.HTTPConnection("163.29.187.206", 80, timeout=30)
	httpClient.request("POST", "/pub/cmpy/cmpyInfoListAction.do", params, headers)
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
