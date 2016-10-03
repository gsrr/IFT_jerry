import sys
import os
import configLoader
import mcommon
import shutil


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

    def replaceAuthType(self, auth):
        src = "/etc/raddb/users.default"
        dst = "/etc/raddb/users"
        items = {'[AuthType]' : auth}
        func = make_replace_func(src, dst)
        func(items) 
        
    def enablePAP(self):
        self.replaceAuthType("PAM") 
        self.enablePAM()
    
    def enableCHAP(self):
        self.replaceAuthType("SYSTEM") 

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
        fr = open("/cfpool/smbpasswd", "r")
        lines = fr.readlines()
        fr.close()
        fw = open("/cfpool/smbpasswd", "w")
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

def main():
    func=getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
