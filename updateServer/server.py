from flask import Flask
from flask import request
from flask_restful import Resource, Api, reqparse
import subprocess

app = Flask(__name__)
api = Api(app)


def write_config(nasip, module):
	keys = ["[nasip]"]
	with open("update.%s.config"%module, "r") as fr:
		lines = fr.readlines()
		with open("update.config", "w") as fw:
			for line in lines:
				line = line.strip()
				for key in keys:
					if key in line:
						line = line.replace(key, nasip)
				fw.write(line + "\n")

def update_client():
	subprocess.call("python update.py", shell=True)

class HelloWorld(Resource):
    def get(self):
    	parser = reqparse.RequestParser()
	parser.add_argument('nasip', type=str)
	parser.add_argument('module', type=str)
	args = parser.parse_args()
	#write_config(request.remote_addr)
	write_config(args['nasip'], args['module'])
	update_client()
        return {'hello': 'world'}

api.add_resource(HelloWorld, '/')

if __name__ == '__main__':
   app.run(host="0.0.0.0")
