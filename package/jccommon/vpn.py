import os
import sys
import cmd
import traceback
import re
sys.path.append("/var/apache/tomcat/webapps/NAS/misc/HAAgent/")
from HADefine import *
from NASHAComm import *
sys.path.append(WEB_ROOT+"misc/Cmd/CmdTool/")
from cmdtool import *
from argparse import *
import subprocess
import shlex


sys.path.append("/root/jccommon")
import vpnparser
import vpncmd

class vpn(cmd.Cmd):

    def __init__(self):
        cmd.Cmd.__init__(self)
        self.name = 'vpn'
        self.cmd_log = cmd_log()
        self.parsers = vpnparser.VPNParser()
        self.vpncmd = vpncmd.VPNCmd()

    @complete_twolevel
    def complete_vpn(self, args):
        pass

    @print_cmd_manual
    def man_vpn(self, args):
        pass

    @print_cmd_usage
    def help_vpn(self, args):
        pass

    @print_cmd_postcmd
    def postcmd(self, stop, line):
        """
            If you want to stop the console, return something that evaluates to .
            If you want to do some post command processing, do it here.
        """
        return stop

    @require_ha_server
    def do_vpn(self, args, HA=None):
        self.ha = HA
        ret = {'status': SYS_SUCCESSFUL}
        try:
            args_list = shlex.split(args)
            cmd, namespace = self.parsers.find(args_list)
            func_name = "cmd_" + cmd
            ret = self.adapter_cmd(namespace, func_name)
        except:
            print traceback.format_exc()
            ret = {'status': CMD_UNKNOWN_PARAM}
            self.cmd_log.cmd_except()
        finally:
            return ret

    @check_ctrl_parameter
    def adapter_cmd(self, args, func_name):
        return getattr(self.vpncmd, func_name)(args)
