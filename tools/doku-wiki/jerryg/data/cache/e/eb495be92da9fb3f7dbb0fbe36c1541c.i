a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"post";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:382:"
# 透過 post 將parameter 以 json object的方式傳送
# 1. content-type : application/json 是跟server說 : 要以json object的方式進行parse.

data={"user" : args['u'], "pwd" : args['p']}
headers = {'content-type': 'application/json'}
url = "http://127.0.0.1:8816/cmd/api/resetPass"
r = requests.post(url, json = data, headers=headers)
print r.status_code
print r.json()
";i:1;N;i:2;N;}i:2;i:26;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:416;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:416;}}