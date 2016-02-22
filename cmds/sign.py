import base64
import hmac
from hashlib import sha1
from urllib import unquote

def sign(cred, secret):
	msg = base64.urlsafe_b64decode(unquote(cred))
	print msg
	s = base64.encodestring(hmac.new(secret, msg, sha1).digest()).strip()
	return s

if __name__ == "__main__":
	cred = "R0VUCgoKCngtYW16LWRhdGU6TW9uLCAxNSBGZWIgMjAxNiAwNjo1MDoxOCBHTVQKLw=="
	secret = "testing"
	print sign(cred, secret)
