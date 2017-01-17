import sys
from samba.netcmd.ntacl import cmd_ntacl_get
from samba.netcmd.ntacl import cmd_ntacl_set
import optparse, samba

class SMB_NTACL:
    def __init__(self):
        pass
    
    def runcmd(self, paras):
        pass

    def get_ntacl(self, fname):
        cmd = samba_tool_path + "get ntacl %s --as-sddl"%fname

def _create_parser(obj):
    parser = optparse.OptionParser()
    parser.add_options(obj.takes_options)
    optiongroups = {}
    for name, optiongroup in obj.takes_optiongroups.iteritems():
        optiongroups[name] = optiongroup(parser)
        parser.add_option_group(optiongroups[name])
    return parser, optiongroups

def ntacl_set(filename, acl):
    ntacl = cmd_ntacl_set()
    parser, optiongroups = _create_parser(ntacl)
    args = [acl, filename]
    kwargs = {
        'versionopts': optiongroups['versionopts'], 
        'credopts': optiongroups['credopts'], 
        'sambaopts': optiongroups['sambaopts']
    }
    ntacl.run(*args, **kwargs)

def ntacl_get(filename):
    ntacl_get = cmd_ntacl_get()
    parser, optiongroups = _create_parser(ntacl_get)
    args = [filename]
    kwargs = {
        'as_sddl': True, 
        'versionopts': optiongroups['versionopts'], 
        'credopts': optiongroups['credopts'], 
        'sambaopts': optiongroups['sambaopts']
    }
    ntacl_get.run(*args, **kwargs)

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func(*sys.argv[2:])

if __name__ == "__main__":
    main()

