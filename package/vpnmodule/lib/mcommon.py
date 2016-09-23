import subprocess

def call_cmdlist(cmd):
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    return proc.stdout.readlines()

def call_cmdstr(cmd):
    proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    lines = proc.stdout.readlines()
    output = [line.strip() for line in lines]
    return output
    
