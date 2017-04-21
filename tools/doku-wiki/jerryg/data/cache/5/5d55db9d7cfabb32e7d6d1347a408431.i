a:12:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:863:"
log level in HA
0 - error
1 - warning
2 - info

log level in syslog
LOG_ERR
LOG_WARNING
LOG_INFO

Modify debug level(HA):
1. python /usr/local/NAS/misc/HAAgent/testHA.py 101 2

Modify debug level(syslog):
local6.*                                                /var/log/NASCmd_debugLog
local5.*                                                /var/log/NAS_message

local6.info                                                /var/log/NASCmd_debugLog
local5.info                                                /var/log/NAS_message

local6.warning                                                /var/log/NASCmd_debugLog
local5.warning                                                /var/log/NAS_message

local6.err                                                /var/log/NASCmd_debugLog
local5.err                                                /var/log/NAS_message
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"iftcron.py - original";}i:2;i:879;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:906;}i:5;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:382:"
def cronlog(msg):
        try:
                fd = open("/var/log/iftcron.log", "a")
                fd.write("[" + time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time())) + "] ")
                fd.write("%s"%(msg))
                fd.write("\n")
                fd.close()
        except:
                print '[CronDaemon.log] exception: %s' % traceback.format_exc()

";i:1;N;i:2;N;}i:2;i:906;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:906;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"iftcron.py - new";}i:2;i:1298;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1320;}i:9;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:126:"            
import iftsyslog
def cronlog(msg = "", level = iftsyslog.LOG_INFO):
        iftsyslog.log("iftcron", level, msg)
";i:1;N;i:2;N;}i:2;i:1320;}i:10;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:799:"
>>> import iftsyslog
>>> iftsyslog.enable_msg("info")
local5.*  to local5.info
0
>>> iftsyslog.enable_cli("err")
local6.info  to local6.err
0
>>> iftsyslog.enable_msg("warning")
local5.err to local5.warning
0
>>> iftsyslog.enable_msg("all")
local5.warning to local5.*
0
>>> iftsyslog.enable_ha()
python /usr/local/NAS/misc/HAAgent/testHA.py 101 2
0
>>> iftsyslog.enable_ha("err")
python /usr/local/NAS/misc/HAAgent/testHA.py 101 0
0
>>> iftsyslog.enable_ha("warning")
python /usr/local/NAS/misc/HAAgent/testHA.py 101 1
0
>>> iftsyslog.enable_all()
local5.info  to local5.info
local6.info  to local6.info
python /usr/local/NAS/misc/HAAgent/testHA.py 101 2
0
>>> iftsyslog.enable_all("err")
local5.info  to local5.err
local6.info  to local6.err
python /usr/local/NAS/misc/HAAgent/testHA.py 101 0
0


";i:1;N;i:2;N;}i:2;i:1461;}i:11;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1461;}}