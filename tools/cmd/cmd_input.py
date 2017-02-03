import cmd
import datetime
import sys
import socket

class CmdInput(cmd.Cmd):

    def init_socket(self, conn):
        pass
        
    def cmdloop(self, intro=None):
        print vars(self)

        return cmd.Cmd.cmdloop(self, intro)

    def parseline(self, line):
        print 'parseline(%s) =>' % line,
        ret = cmd.Cmd.parseline(self, line)
        print ret
        return ret

    def onecmd(self, s):
        print 'onecmd(%s)' % s
        return cmd.Cmd.onecmd(self, s)

    def emptyline(self):
        print 'emptyline()'
        return cmd.Cmd.emptyline(self)

    def default(self, line):
        print 'default(%s)' % line
        return cmd.Cmd.default(self, line)

    def precmd(self, line):
        print datetime.datetime.now(), 'precmd(%s)' % line
        return cmd.Cmd.precmd(self, line)

    def postcmd(self, stop, line):
        print datetime.datetime.now(), 'postcmd(%s, %s)' % (stop, line)
        return cmd.Cmd.postcmd(self, stop, line)

    def do_greet(self, line):
        print 'hello,', line

    def do_EOF(self, line):
        sys.exit(0)

    def do_exit(self, line):
        sys.exit(0)

def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    while True:
        cmd = CmdInput()
        cmd.init_socket()
        cmd.cmdloop('raw input by user')
    
if __name__ == '__main__':
    main()
