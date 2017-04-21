a:40:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Q4: openssl command";}i:2;i:1;}i:3;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:26;}i:4;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1374:"
# create certificate
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

# display the contents of a PEM formatted certificate under Linux
openssl x509 -in acs.qacafe.com.pem -text

# remove key phrase
openssl rsa -in key.pem -out newkey.pem
------------------------
Validity (365 days)
            Not Before: Dec 19 03:06:25 2016 GMT
            Not After : Dec 19 03:06:25 2017 GMT
------------------------

#超過valid的時間時, client若使用過期的cert:
[root@nas_8812029_a Cmd]# python nascmd_client.py --ssl -c "ha status -z a@)"
Traceback (most recent call last):
  File "nascmd_client.py", line 238, in <module>
    main()
  File "nascmd_client.py", line 230, in main
    exec_command_mode(paras['command'])
  File "nascmd_client.py", line 104, in exec_command_mode
    cli = Client(SSL_ENABLE)
  File "nascmd_client.py", line 19, in __init__
    self.init_ssl_socket()
  File "nascmd_client.py", line 27, in init_ssl_socket
    self.s.connect(("localhost", 6101))
  File "/usr/lib64/python2.7/ssl.py", line 846, in connect
    self._real_connect(addr, False)
  File "/usr/lib64/python2.7/ssl.py", line 837, in _real_connect
    self.do_handshake()
  File "/usr/lib64/python2.7/ssl.py", line 810, in do_handshake
    self._sslobj.do_handshake()
ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:765)

";i:1;N;i:2;N;}i:2;i:26;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:26;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Q3: java ssl socket";}i:2;i:1410;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1435;}i:8;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1693:"
# reference
1. https://docs.oracle.com/javase/tutorial/security/toolfilex/rstep1.html
2. http://www.java2s.com/Tutorial/Java/0490__Security/SunSSLSocketClient.htm

# import cert.pem to keystore
keytool -import -alias stan -file cert.pem -keystore .keystore

# java example code
import java.io.*;
import java.net.*;
import java.security.*;

import javax.net.ssl.SSLSocketFactory;

import com.sun.net.ssl.SSLContext;
import com.sun.net.ssl.TrustManagerFactory;
import com.sun.net.ssl.TrustManager;

public class MainClass {

    private static final String HOST = "172.27.113.157";

    private static final int PORT = 6101;

    public static void main(String[] args) throws Exception {

        char[] passphrase = "111111".toCharArray();
        KeyStore keystore = KeyStore.getInstance("JKS");
        keystore.load(new FileInputStream(".keystore"), passphrase);

        TrustManagerFactory tmf = TrustManagerFactory.getInstance("SunX509");
        tmf.init(keystore);

        SSLContext context = SSLContext.getInstance("TLS");
        TrustManager[] trustManagers = tmf.getTrustManagers();

        context.init(null, trustManagers, null);

        SSLSocketFactory sf = context.getSocketFactory();

        Socket s = sf.createSocket(HOST, PORT);
        OutputStream out = s.getOutputStream();
        out.write("\nConnection established.\n\n".getBytes());

        int theCharacter = 0;
        theCharacter = System.in.read();
        while (theCharacter != '~') // The '~' is an escape character to exit
        {
            out.write(theCharacter);
            out.flush();
            theCharacter = System.in.read();
        }

        out.close();
        s.close();
    }
}

";i:1;N;i:2;N;}i:2;i:1435;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1435;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"Q2 : The days of self-certificate is limited?";}i:2;i:3139;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3190;}i:12;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1:"
";i:1;N;i:2;N;}i:2;i:3190;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3190;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"Q1 : what is ssl?";}i:2;i:3201;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3218;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3218;}i:17;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:74:"http://www.ntu.edu.sg/home/ehchua/programming/webprogramming/http_ssl.html";i:1;N;}i:2;i:3220;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:3298;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3304;}i:20;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:132:"
ssl is stands for secure socket layer, it provides secure communication between client and server.
The protocol stack is as below.
";i:1;N;i:2;N;}i:2;i:3304;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3304;}i:22;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:36:":tool:np110614000811061414250101.png";i:1;s:0:"";i:2;N;i:3;s:3:"400";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:3445;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3490;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3490;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:134:"由stack看起來, application layer的訊息會先被ssl加密, 變成ssl的header, 這個header再放在tcp stack上面進行傳輸.";}i:2;i:3492;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3626;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3626;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:"主要有3種資料, 分別是:SSL Handshake、SSL Change Cipher spec及SSL Alert.";}i:2;i:3628;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3710;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3710;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"SSL Handshake是一開始雙方交換資料所需的一些訊息,";}i:2;i:3712;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3777;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3777;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"SSL Change Cipher則是指定雙方加解密的演算法.";}i:2;i:3779;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3836;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3836;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"SSL Alert 則是當錯誤發生時, 送給對方的error message.";}i:2;i:3838;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3903;}i:39;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3903;}}