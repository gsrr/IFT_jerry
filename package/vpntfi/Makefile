all:
	cp ./vpn.py /usr/local/NAS/misc/Cmd/Exec/Service/vpn.py
	cp ./vpnLib.py /usr/local/NAS/misc/HAAgent/Lib/Service/vpnLib.py
	cp ./VPNConfig.py /usr/local/NAS/misc/HAAgent/Config/VPNConfig.py
	cp ./VPNConfig.xml /usr/local/NAS/misc/HAAgent/Config/VPNConfig.xml
	python /usr/local/NAS/misc/HAAgent/testHA.py 99 vpnLib 
	cp -R ../vpnmodule /usr/local/NAS/misc/agent/python/
