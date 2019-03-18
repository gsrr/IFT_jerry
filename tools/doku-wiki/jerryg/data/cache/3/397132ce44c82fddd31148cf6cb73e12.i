a:6:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"opengrok in windows";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:2534:"
[Installation]
1. Tomcat 8 or higher
https://tomcat.apache.org/download-80.cgi#8.5.24

2. opengrok package
https://github.com/OpenGrok/OpenGrok/wiki/How-to-install-OpenGrok
https://github.com/OpenGrok/OpenGrok/releases/download/1.1-rc18/opengrok-1.1-rc18.tar.gz

3. ctags package
https://github.com/universal-ctags/ctags-win32/releases
https://github.com/universal-ctags/ctags

4. JDK 1.8 or higher

[Procedure]
1. Tomcat server test
1.1 set JAVA_HOME="D:\Progs\jdk1.7.0_45_x64"
--> set JAVA_HOME environment variable

1.2 ..\apache-tomcat-8.5.24\bin>startup.bat
--> start tomcat server

1.3 http:\\127.0.0.1:8080
--> connect to tomcat server

2. Steps for installing opengrok
2.1 Download the OpenGrok binary from OpenGrok Binary.
2.2 Unzip the tar to a location say "G:\OpenGrok"
2.3 Download Ctags from Ctags Windows Binary.
2.4 Extract Ctags to a location say "G:\Ctags"
2.5 Download and install Tomcat.
2.6 OpenGrok needs the following to run
--> A configuration.xml that is generated using the command in step 10.
--> Location to the source being indexed. (SRC_ROOT)
--> Location to the "Ctag" generated grokData, again refer to step 10.  (DATA_ROOT)

2.7 Extract the "war" file in the "lib" folder in the extracted OpenGrok location. In this case  G:\opengrok\lib\
2.8 Edit the WEB-INF\web.xml file to include the information
--> A configuration.xml
--> Location to the source being indexed. (SRC_ROOT)

<context-param>  
   <param-name>CONFIGURATION</param-name>  
   <param-value>G:\opengrok\configuration.xml</param-value>  
   <description>Full path to the configuration file where OpenGrok can read it's configuration</description>  
</context-param>  
  -------Added the below------  
<context-param>    
   <param-name>SRC_ROOT</param-name>  
   <param-value>G:\CodeSource</param-value>  
</context-param>  
<context-param>  
   <param-name>DATA_ROOT</param-name>  
   <param-value>G:\opengrok-0.11.1\grokdata</param-value>    
</context-param> 


 
2.9 Copy the the extracted source.war with the modified web.xml to the tomcat webapps folder. 
Index the source and generate the configuration.xml file using the below command (G:\opengrok-0.11.1\lib has the jar file)

java -jar opengrok.jar -W G:\opengrok-0.11.1\configuration.xml -c G:\ctags58\ctags.exe -P -S -v -s G:\CodeSource -d G:\opengrok-0.11.1\grokdata
  
2.10 Launch Tomcat after the indexing in done. 
--> Open http://localhost:8080/source and wola you have a wicked fast source browser. 
2.11 Reindex if you need to add new projects/pick new source etc.
 
";i:1;N;i:2;N;}i:2;i:40;}i:4;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2582;}i:5;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2582;}}