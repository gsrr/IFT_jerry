import sys
import subprocess
import traceback
import os
from pwd import getpwnam  
from pwd import getpwuid 
import time
ACCESS_FAIL = 34101

def getfacl(path):
    try:
        ret = {}
        cmd = ['getfacl', path]
        proc = subprocess.Popen(cmd, stdout = subprocess.PIPE, stderr = subprocess.PIPE)
        out, err = proc.communicate()
        out = out.splitlines()
        for line in out:
            print line
    except:
        print traceback.format_exc()

def acl2mode(acl):
    modeDict = {
        "r" : os.R_OK,
        "w" : os.W_OK,
        "x" : os.X_OK,
    }
    return modeDict[acl]


def _accessFile(path, user, acl):
    mode = acl2mode(acl)
    #userInfo = getpwnam(user)  #pwd.getpwuid(uid)
    userInfo = getpwuid(int(user))
    print userInfo
    os.setgid(userInfo.pw_gid)
    os.setuid(userInfo.pw_uid)
    print os.getuid()
    print os.getgid()
    print os.geteuid()
    print os.getegid()
    print path, mode, os.W_OK
    ret = os.access(path, mode)
    print ret
    if ret == False:
        return 1
    else:
        return 0

def authByAcl(method, paths, user):
    ret_acl = 0
    acl = None
    if method == "PUT": #DELETE, POST, GET
        acl = "w"
    elif method == "DELETE":
        acl = "x"
    else:
        acl = "r"
    
    ret_acl = accessFile(paths[0], user, acl)
    if ret_acl != 0:
        return -1

    if paths[1] != None and os.path.exists(paths[1]) == True:
        ret_acl = accessFile(paths[1], user, acl)
        if ret_acl != 0:
            return -1
    
    if paths[2] != None and os.path.exists(paths[2]) == True:
        ret_acl = accessFile(paths[2], user, acl)
        if ret_acl != 0:
            return -1
    
    return 0 
    
def access2user(accessKey):
    cmd = "/usr/bin/python /usr/local/NAS/misc/HAAgent/Lib/Service/ossLib.py test_access2user %s"%accessKey
    subpro = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    output = subpro.stdout.readline().strip()
    return output

def accessFile(path, accessKey, acl):
    user = access2user(accessKey)
    cmds = [
        'python',
        '/usr/lib/python2.7/site-packages/swift/common/accessFile.py',
        path,
        user,
        acl,
    ]
    os.system("echo \"%s\" >> /var/log/iftauth.log"%("access file:%s"%(" ".join(cmds))))
    try:
        ret = subprocess.call(cmds)       
        return ret
    except:
        return ACCESS_FAIL

#python accessFile.py $path $user $acl
def main():
    path = sys.argv[1]
    user = sys.argv[2]
    acl = sys.argv[3]
    if _accessFile(path, user, acl) == 0:
        print 0
    else:
        print -1

if __name__ == "__main__":
    main()
