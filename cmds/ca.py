import ssl
import subprocess
import os

def saveCertificateToDB(ip, port, path='/etc/openldap/cacert/'):
	os.system('mkdir -p %s'%path)
	crtPath = os.path.join(path,'nasca.crt')
	try:
		certificate = ssl.get_server_certificate((ip, int(port)))
	except:
		return {'status':SSL_CONNECTION_REFUSED_ERROR,'msg':'get certificate connection refused'}
	f = open(crtPath, 'w')
	f.write(certificate)
	f.close()
	
	#get issuer
	cmd=["openssl","x509","-issuer","-noout"]
	p = subprocess.Popen(cmd,shell=False,stdin=subprocess.PIPE,stderr=subprocess.PIPE, stdout=subprocess.PIPE)
	out,err = p.communicate(certificate)
	ret = p.returncode
	if ret != 0:
		return {'status':CERTIFICATE_FILE_ERROR,'msg':'test certificate file fail','out':out,'err':err}
	
	try:
		issuer = out
		tmpList=out.split("/")
		for tmp in tmpList:
			if tmp.startswith('CN='):
				issuer = tmp[3:]
	except:
		pass
	
	os.system('/usr/bin/rm %s'%os.path.join(path,'*.db'))
		
	cmd = ['/usr/bin/certutil','-A','-n','NASCA','-i',crtPath,'-a','-t','CT','-d',path]
	ret = os.system(" ".join(cmd))
	print " ".join(cmd)
	if ret != 0:
		print "certutil fail"
	
	return {'status': 0,'issuer':issuer}

saveCertificateToDB("172.27.114.106", 636)
