a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:53:"Gui send A/B controller in G-Model, How to handle it?";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:413:"
# Description
The NASCLI receive primary controller in Primary controller, 
then send the command to HA Lib according to controller parameter of command.

# Example
def func(HAServer, paraList):
    if paraList['controller'] != HA.currentController():
        return {'status' : 0}

# Attention
A:Successful , B: Successful -> GUI Successful
A:Successful , B: Fail -> GUI Fail
A:Fail , B: Successful -> GUI Fail
";i:1;N;i:2;N;}i:2;i:74;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:495;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:495;}}