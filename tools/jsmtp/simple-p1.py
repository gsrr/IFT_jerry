#!/usr/bin/python
# -*- coding: utf-8 -*-

import traceback
import socket
import base64
import sys
import os,io
import time

checkTimes = 5
checkIndex = 0

def base64Encoding(msg, charset = "UTF-8"):
    try:
        b64 = base64.b64encode(msg.encode(charset.lower())).decode()
        return b64
    except:
        print traceback.format_exc()
        return None
def GetData(filename,sender,receiver):
    myfile = open(filename, "r")
    data = ""
    for line in myfile.readlines():

        if "Date:" in line:
            continue
        elif "Reply-To:" in line:
            continue
        ## 將信件內 TO 改成我們指定的 receiver
        elif "To:" in line:
            data += "To:  %s\r\n" % (receiver)
        ## 將信件內 FROM 改成我們指定的sender
        elif "From:" in line:
            data += "From:  %s\r\n" % (sender)
        else:
            if line == ".\n" or line == ".\r\n":
                line = "." + line
            data += line
    print data
    return data

def GetSmtpIP(domain):
    result = os.popen("dig " + domain + " MX +short").read()
    MinNum = 999999
    print result
    IP = ""
    for line in result.split('\n'):
        sp = line.split()
        if len(sp) == 2:
            if int(sp[0]) < MinNum:
                MinNum = int(sp[0])
                IP = sp[1]
    print IP
    return IP

def socketCheckMail(sck,mailAddr,mode):
    ## mode = 1 is send
    ## mode = 2 is recv

    ## 以 mode 變數偵測 現在是 1 send mode 還是 2 recv mode
    command = ""
    if mode == 1:
        command = "MAIL FROM: <" + mailAddr + "> \r\n"
        print "########3 MAIL FROM %s" % (mailAddr)
    else :
        command = "RCPT TO: <" + mailAddr + "> \r\n"
        print "########4 RCPT TO %s" % (mailAddr)
    

    ## Send sender mail to SMTP then check
    ## 傳送指令
    sck.send(command)
    message = sck.recv(1024)
    # print message

    ## Check result
    ## Parse result 將回傳結果依照空白切開
    result = message.split(" ")
    print result

    ## result鎮列中第一個為status code 並轉為int 做比較
    statusCode = int(result[0])
    # print statusCode / 100
    ## 取 status 百位數(也就是除100)來比較 
    statusMainCode = int(statusCode/100)
    # print statusMainCode
    # statusMainCode = 4 # debug use

    ## 如果是2xx 正常運作
    if statusMainCode == 2:
        ## status = 2xx
        return 
    ## 如果是4xx
    elif statusMainCode == 4:
        ## status = 4xx
        thisIntervalTime = 5
        global checkIndex 
        checkIndex = checkIndex + 1
        ## 先計算錯誤次數 如果超過 5 次即暫停程式
        if (checkIndex >= checkTimes) :
            print 'Status code %d exit program in %d times' % (statusCode,checkIndex)
            sys.exit(0)
        
        ## 先計算錯誤次數 如果超過小於 5 次變暫停5秒 並執行下一次此步驟
        print 'Sleeping for %d seconds' % (thisIntervalTime)
        time.sleep(thisIntervalTime) # sleep 5 second
        socketCheckMail(sck,mailAddr,mode)

    ## 如果是5xx 暫停程式
    elif statusMainCode == 5:
        ## status = 5xx
        print 'Status code %d exit program' % (statusCode)
        sys.exit(0)

def is_str(s):
    return isinstance(s, basestring)


def extract_from(line, sender):
    items = line.split('\\t')
    title, mail = items[2].split(None, 1)
    return "From: =?%s?B?%s?= <%s>\r\n" % (items[1], base64Encoding(title, items[1]), mail.strip())
    #return "From: =?%s?B?%s?= <%s>\r\n" % (items[1], base64Encoding(title, items[1]), sender.strip())

def extract_to(line, receiver):
    if line == "":
        return "To: <%s>\r\n" % (receiver)
    else:
        items = line.split('\\t')
        return "To: =?%s?B?%s?= <%s>\r\n" % (items[1], base64Encoding(items[2].strip(), items[1]), receiver)

def extract_subject(line):
    items = line.split('\\t')
    return "Subject: =?%s?B?%s?=\r\n" % (items[1], base64Encoding(items[2], items[1]))

def convert_date(line):
    t = line.split(',')[1].strip()
    t += " +0800 (CST)"
    return "Date: %s\r\n"%t

def construct_header(sender, receiver, header_file, body_file):
    Fromline = ""
    Toline = ""
    Dateline = ""
    Subjectline = ""
    Bodyline = ""

    headerfile = io.open(header_file, "r",encoding='utf-8')
    content = ""

    for line in headerfile.readlines():
        if "Date" in line:
            Dateline = line
        elif "From" in line:
            Fromline = line
        elif "To" in line:
            Toline = line
        elif "Subject" in line:
            Subjectline = line

    with open(body_file, "r") as fr:
        Bodyline = fr.readline() 

    header = extract_from(Fromline, sender)
    header += extract_to(Toline, receiver)
    header += convert_date(Dateline)
    header += extract_subject(Subjectline)
    header += 'MIME-Version: 1.0\r\n'
    header += 'Content-Type: multipart/alternative; boundary=boundary421234\r\n'
    header += 'X-Priority: 3\r\n'
    header += 'X-MSMail-Priority: Normal\r\n'
    header += 'X-MimeOLE: ver1.0\r\n'
    header += '\r\nThis is a multi-part message in MIME format.\r\n'
    header += '\r\n--boundary421234\r\n'
    header += 'Content-Type:text/plain;charset="%s"\r\n'%(Bodyline.strip().split()[0])
    header += "Content-Transfer-Encoding:base64\r\n"
    return header

def construct_body(body_file):
    with open(body_file, "r") as fr:
        data = fr.readlines()

    charset = data[0].split()[0]
    content = ""
    for line in data[1:]:
        content += line.strip()
        content += "\r\n"
    
    content = base64Encoding(content.decode("utf-8"), charset)
    return content + "\r\n.\r\n"

def Send(receiver, sender, header_file, body_file):
    
    #authorization if needs
    check = 'n'
    # check = raw_input("Is you need authorization? Please enter y or n :")
    # if check == 'y':
    #     Username = raw_input("Inesrt Username: ")
    #     Password = raw_input("Insert Password: ")

    receiverdomain = receiver[receiver.index('@') + 1:]

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    ## 可以自己手動指定 SMTP 的主機
    # smtpServer = "smtp.net.nthu.edu.tw"
    # s.connect((smtpServer, 25))

    ## 又或者自動搜尋 GetSmtpIP() SMTP 的port為 25
    s.connect((GetSmtpIP(receiverdomain), 25))
    
    message = s.recv(1024)
    print "########1"
    print message

    # 登陸郵件服務器的命令 EHLO HI
    s.send("EHLO HI \r\n")
    message = s.recv(1024)
    print "########2"
    print message

    # s.send("STARTTLS\r\n")
    # recvdiscard = s.recv(1024)
    # print(recvdiscard)

    if check == 'y':
        UP = ("\x00" + Username + "\x00" + Password).encode("base64")
        UP = UP.strip("\n")
        ## AUTH PLAIN\r\n (登錄命令)
        ## 並將漲密轉為 base64
        print "AUTH PLAIN " + UP
        message = s.recv(1024)

    ## 設定 sender
    socketCheckMail(s,sender,1)

    ## 設定 receiver 注意，可以不只一個人
    socketCheckMail(s,receiver,2)

    ## 設定 信件內容，使用DATA發送命令說我要開始傳內文了
    # s.send("DATA\r\n")
    cmd = "DATA\r\n"
    s.send(cmd.encode('utf-8'))
    # message = s.recv(1024)
    print "########5 DATA"
    print message


    header = construct_header(sender, receiver, header_file, body_file)
    body = construct_body(body_file)
    mail = header + body
    print mail
    s.send(mail.encode('utf-8'))

    message = s.recv(1024)
    print "########6 READ MAIL AND SEND"
    print "message:", message

    # s.send("QUIT\r\n")
    cmd = "QUIT\r\n"
    s.send(cmd.encode('utf-8'))
    message = s.recv(1024)
    print "########7 QUIT"
    print message
    s.close()

if __name__ == "__main__":
    args = sys.argv
    Send(args[1], args[2], args[3], args[4])
