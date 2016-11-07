import cmd
import traceback
import shlex
import sys
sys.path.append("/var/apache/tomcat/webapps/NAS/misc/HAAgent/")
sys.path.append(WEB_ROOT+"misc/Cmd/CmdTool/")
from cmdtool import *
sys.path.append(WEB_ROOT+"misc/Cmd/CmdTool/Parser/")

class [module_name](cmd.Cmd):

    def __init__(self):
        cmd.Cmd.__init__(self)
        self.name = [module_name]
        self.cmd_log = cmd_log()
        self.ha = None
        self.parsers = [module_name]parser.[module_name_upper]Parser()

    @complete_twolevel
    def complete_[module_name](self, args):
        pass

    @print_cmd_manual
    def man_[module_name](self, args):
        pass

    @print_cmd_usage
    def help_[module_name](self, args):
        pass

    @print_cmd_postcmd
    def postcmd(self, stop, line):
        """
            If you want to stop the console, return something that evaluates to .
            If you want to do some post command processing, do it here.
        """
        return stop

    @require_ha_server
    def do_[module_name](self, args, HA=None):
        self.ha = HA
        ret = {'status': SYS_SUCCESSFUL}
        try:
            args_list = shlex.split(args)
            cmd, namespace = self.parsers.find(args_list)
            func_name = "cmd_" + cmd
            ret = self.adapter_cmd(namespace, func_name)
        except:
            self.cmd_log.cmd_except()
            ret = {'status': CMD_UNKNOWN_PARAM}
        finally:
            return ret

    @check_ctrl_parameter
    def adapter_cmd(self, args, func_name):
        ret = getattr(self, func_name)(args)
        if ret['status'] == 0:
            ret['status'] = "SYS_SUCCESSFUL"
        else:
            return {'status' : 'SYS_FAILED'}
        return ret

    def cmd_[module_name]_test(self, args):
        args['op'] = "lib_test"
        ret = self.ha.callGetLocalFunc("[module_name]Lib", paras)
        print ret

