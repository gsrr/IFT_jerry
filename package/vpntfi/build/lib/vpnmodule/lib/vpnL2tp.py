import sys
import os
import copy
import configLoader
import mcommon

class VPNL2TP:
    def __init__(self):
        self.clobj = configLoader.ConfigVPNL2TP(cfg="/etc/xl2tpd/xl2tpd.conf.default")
        self.clobj.load()
        self.sections = {
            'global' : '[global]',
            'lns' : '[lns default]'
        }
        self.services = ['xl2tpd', 'strongswan']

    def getcfg(self):
        print self.clobj.cfg

    def _add(self, *paras):
        section = self.sections[paras[0]]
        key = paras[1]
        value = paras[2]
        self.clobj.add(section, key, value)
    
    def _remove(self, *paras):
        section = self.sections[paras[0]]
        key = paras[1]
        self.clobj.remove(section, key)
    
    def _clearEncAttr(self):
        self._remove('lns', 'refuse pap')
        self._remove('lns', 'require pap')
        self._remove('lns', 'refuse chap')
        self._remove('lns', 'require chap')
        
    def enableRequireAttr(self):
        self._add('lns', 'unix authentication', 'yes')

    def enablePAP(self):
        self._clearEncAttr()
        self._add('lns', 'require pap', 'yes')
        self._add('lns', 'refuse chap', 'yes')

    def enableMSCHAP(self):
        self._clearEncAttr()
        self._add('lns', 'refuse chap', 'yes')
        self._add('lns', 'refuse pap', 'yes')

    def setLocalip(self, *paras):
        ip = paras[0]
        max_conns = paras[1]
        iphead = ip[::-1].split(".",1)[1][::-1]
        iprange = "%s.1-%s.%s"%(iphead, iphead, max_conns)
        self._add('lns', 'local ip', paras[0])
        self._add('lns', 'ip range', iprange)
        
    def unload(self):
        self.clobj.unload("/etc/xl2tpd/xl2tpd.conf")

    def start(self):
        for srv in self.services:
            os.system("systemctl start %s"%srv)    
    
    def stop(self):
        for srv in self.services:
            os.system("systemctl stop %s"%srv)    
        
    def restart(self):
        for srv in self.services:
            os.system("systemctl restart %s"%srv)    

    def status(self):
        cmd = "systemctl is-active xl2tpd"
        output = mcommon.call_cmdstr(cmd)[0]
        return output
        
    def _captureSrcIP(self, ipremote):
        files = os.listdir("/cfpool/vpnserver/connection")
        for f in files:
            if ipremote in f:
                return f.split("_")[1].strip()

    def view(self):
        output = []
        cmd = "ps -ef | grep pppd | grep -v grep | awk '{print $2}'"
        pids = mcommon.call_cmdstr(cmd)
        if len(pids) > 0:
            for pid in pids:
                data = {}
                cmd = "tdbdump -k pppd%s /var/run/ppp/pppd2.tdb"%pid
                raw = mcommon.call_cmdstr(cmd)[0]
                for line in raw.split(";"):
                    if "PPPLOGNAME" in line: 
                        key, data[key] = line.split("=", 1)
                    if "PEERNAME" in line: 
                        key, data[key] = line.split("=", 1)
                    elif "IPREMOTE" in line:
                        key, data[key] = line.split("=", 1)
                        data[key] = data[key].split("\\")[0]
                cmd = "ps -p %s -o etime="%pid                
                raw = mcommon.call_cmdstr(cmd)[0]
                conninfo = {}
                conninfo['uptime'] = raw.strip()
                conninfo['src_ip'] = self._captureSrcIP(data['IPREMOTE'])
                conninfo['user'] = data['PEERNAME'] if data.get('PEERNAME') != None else data.get('PPPLOGNAME')
                conninfo['lan_ip'] = data['IPREMOTE']
                output.append(copy.deepcopy(conninfo))
        return output

    def cut(self, *paras):
        vpnip = paras[0]
        cmd = "ps -ef | grep pppd | grep -v grep | grep %s | awk '{print $2}'"%vpnip
        pid = mcommon.call_cmdstr(cmd)
        if len(pid) > 0:
            cmd = "kill -9 %s"%pid[0]
            mcommon.call_cmdstr(cmd)
        return {'status' : 0}

    def showconf(self):
        os.system("cat /etc/xl2tpd/xl2tpd.conf")


def decor_test(func):
    def wrap_func():
        vpnobj = VPNL2TP()
        vpnobj.getcfg()
        func(vpnobj)
        vpnobj.unload()
        vpnobj.restart()
        vpnobj.showconf()
        
    return wrap_func

@decor_test
def test_enablePAP(vpnobj):
    vpnobj.enablePAP()
   
@decor_test
def test_enableCHAP(vpnobj):
    vpnobj.enableCHAP()

def test_status():
    vpnobj = VPNL2TP()
    print vpnobj.status()

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
