headers = '''
Content-Type:application/x-www-form-urlencoded
Cookie:JSESSIONID=5B4554A26442E3D585535D3DCBE58758
'''

print dict([line.split(":") for line in headers.strip().split("\n")])


