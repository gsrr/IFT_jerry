all:
	python setup.py /usr/local install --install-purelib=/usr/local/NAS/misc/agent/python/ -f
	python /usr/local/NAS/misc/HAAgent/testHA.py 99 vpnLib 

ha:
	python setup.py /Pool-1/f1/github/HA install --install-purelib=/Pool-1/f1/github/HA/NAS/misc/agent/python/ -f
	python /usr/local/NAS/misc/HAAgent/testHA.py 99 vpnLib 

clean:
	rm -rf ./build
	rm -rf files.txt

