import sys
import os
import configLoader
import mcommon
import shutil


VPNMODULE_CONF = "/usr/local/NAS/misc/agent/python/vpnmodule/conf/"

def make_replace_func(src, dst):
    def wrap_func(items):
        with open(src, "r") as fr:
            with open(dst, "w") as fw:
                for line in fr.readlines():
                    for key in items.keys():
                        if key in line:
                            line = line.replace(key, items[key])
                            break
                    fw.write(line)
    return wrap_func

class RADIUS:
    def __init__(self, conf = None):
        pass
    
    def enablePAM(self):
        os.system("ln -s /etc/raddb/mods-available/pam /etc/raddb/mods-enabled/pam")

    def enableNTLM(self):
        os.system("ln -s /etc/raddb/mods-available/smbpasswd /etc/raddb/mods-enabled/smbpasswd")

    def replaceAuthType(self, auth):
        if auth == "PAM":
            src = VPNMODULE_CONF + "/etc/raddb/users.pap"
            dst = "/etc/raddb/users"
            shutil.copyfile(src, dst)

            src = VPNMODULE_CONF + "/etc/raddb/sites-available/default.pap"
            dst = "/etc/raddb/sites-available/default"
            shutil.copyfile(src, dst)
        elif auth == "SYSTEM":
            src = VPNMODULE_CONF + "/etc/raddb/users.mschap"
            dst = "/etc/raddb/users"
            shutil.copyfile(src, dst)
            src = VPNMODULE_CONF + "/etc/raddb/sites-available/default.mschap"
            dst = "/etc/raddb/sites-available/default"
            shutil.copyfile(src, dst)
            
    def cleanSetting(self):
        os.system("rm -rf /etc/raddb/mods-enabled/pam")
        os.system("rm -rf /etc/raddb/mods-enabled/smbpasswd")

    def enablePAP(self):
        self.cleanSetting()
        self.replaceAuthType("PAM") 
        self.enablePAM()
    
    def enableCHAP(self):
        self.cleanSetting()
        self.replaceAuthType("SYSTEM") 
        self.enableNTLM()

    def disableAuthAD(self):
        src = "/etc/raddb/mods-available/mschap.default"
        dst = "/etc/raddb/mods-available/mschap"
        shutil.copyfile(src, dst)
        self.restart()
        
    def enableAuthAD(self):
        src = "/etc/raddb/mods-available/mschap.default"
        dst = "/etc/raddb/mods-available/mschap"
        items = {'#[ntlm_auth]' : 'ntlm_auth'}
        func = make_replace_func(src, dst)
        func(items) 
        self.restart()
         
    def start(self):
        os.system("mkdir /var/run/radiusd")
        os.system("radiusd -t")

    def stop(self):
        os.system("ps -ef | grep radiusd | grep -v grep | awk '{print $2}' | xargs kill -9")

    def restart(self):
        self.stop()
        self.start()
        return {'status' : 0}

    def status(self):
        cmd = "ps -ef | grep radiusd | grep -v grep"
        output = mcommon.call_cmdstr(cmd)
        if len(output) > 0 and "radiusd -t" in output[0]:
            return "active"
        else:
            return "failed"

    def NTLMPasswd_adduser(self, *paras):
        user = paras[0]
        passwd = paras[1]
        cmd = "printf '%s'| iconv -t utf16le | openssl md4"%passwd
        output = mcommon.call_cmdstr(cmd)[0]
        ntlm_passwd = output.split("=", 1)[1].strip()
        with open("/cfpool/smbpasswd", 'a') as fw:
            template = "%s:0:%s:%s:[U         ]:LCT-00000000:%s"%(user, ntlm_passwd, ntlm_passwd, user)
            fw.write(template + "\n")
        return {'status' : 0}

    def NTLMPasswd_deleteuser(self, *paras):
        user = paras[0]
        fr = open("/etc/smbpasswd", "r")
        lines = fr.readlines()
        fr.close()
        fw = open("/etc/smbpasswd", "w")
        for line in lines:
            if user not in line:
                fw.write(line)
        fw.close()
        return {'status' : 0}

def test_disableAuthAD():
    obj = RADIUS()
    obj.disableAuthAD()

def test_enableAuthAD():
    obj = RADIUS()
    obj.enableAuthAD()

def test_start():
    obj = RADIUS()
    obj.start()

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
