import sys
import os

sys.path.append("/root/")
from jccommon import fileop

# vpn config <-z {a|b}@serviceID> [-p ip_pool] [-x max_conn] [-a {chap|pap}] [-k psk] [-d dns_ip]
class State:
    def __init__(self, *paras):
        self.cxt = paras[0]
        self.name = "start"

    def run(self, c):
        if c != " " and c != "<" and c != "[":
            self.cxt.appendChar(c)
        self.cxt.changeState(c)

class CommandState(State):
    def __init__(self, *paras):
        State.__init__(self, *paras)
        self.name = "command"
    
    def run(self, c):
        if c == " ":
            self.cxt.appendToken()
            self.cxt.changeState(c)
        else:
            self.cxt.appendChar(c)

class RequireState(State):
    def __init__(self, *paras):
        State.__init__(self, *paras)
        self.name = "require"

    def run(self, c):
        if c == " ":
            self.cxt.changeState(c)
        else:
            self.cxt.appendChar(c)

class OptionalState(State):
    def __init__(self, *paras):
        State.__init__(self, *paras)
        self.name = "optional"

    def run(self, c):
        if c == " ":
            self.cxt.changeState(c)
        else:
            self.cxt.appendChar(c)

class NullState(State):
    def __init__(self, *paras):
        State.__init__(self, *paras)
        self.name = "null"

    def run(self, c):
        if c in ["[", "<", "{"]:
            self.cxt.changeState(c)
        else:
            if c in ["]", ">"]:
                self.cxt.appendToken()
                

class OptionState(State):
    def __init__(self, *paras):
        State.__init__(self, *paras)
        self.name = "option"

    def run(self, c):
        if c == "}":
            self.cxt.changeState(c)
        else:
            self.cxt.appendOption(c)

class Context:
    def __init__(self):
        self.statemap = {
            'start' : State(self),
            'command' : CommandState(self),
            'require' : RequireState(self),
            'optional' : OptionalState(self),
            'option' : OptionState(self),
            'null' : NullState(self),
        }
        self.state = self.statemap['start']
        self.token = {'name' : "", "type" : "", "option" : ""}
        self.ret = []
    
    def changeState(self, c):
        if self.state.name == "require":
            self.state = self.statemap["null"]
        elif self.state.name == "optional":
            self.state = self.statemap["null"]
        elif self.state.name == "option":
            self.state = self.statemap["null"]
        else:
            if c == "[":
                self.state = self.statemap["optional"]
                self.token['type'] = "optional"
            elif c == "<":
                self.state = self.statemap["require"]
                self.token['type'] = "require"
            elif c == "{":
                self.state = self.statemap["option"]
            elif c == " " or c == ">" or c == "}" or c == "]":
                self.state = self.statemap['start']
            else:
                self.state = self.statemap["command"]
                self.token['type'] = "command"
    
    def appendToken(self):
        self.ret.append(self.token)
        self.token = {'name' : "", "type" : "", "option" : ""}

    def appendOption(self,c ):
        self.token['option'] += c

    def appendChar(self, c):
        self.token['name'] += c

    def setState(self, s):
        self.state = self.statemap[s]

    def run(self, c):
       self.state.run(c)

    def show(self):
        for t in self.ret:
            print t

def parseline(line):
    cxt = Context()
    for c in line:
       cxt.state.run(c) 
    cxt.show()
    
def main():
    lines = fileop.readFile("cmds")
    for line in lines:
        print 
        parseline(line)
    

if __name__ == "__main__":
    main()
