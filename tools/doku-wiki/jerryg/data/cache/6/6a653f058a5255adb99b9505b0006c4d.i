a:3:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:780:"
# Reference
1. http://tw.gitbook.net/sqlite/sqlite_python.html


# ex1 , create db and insert data
>>> import sqlite3
>>> conn = sqlite3.connect('/root/test.db')
>>> conn.execute('''CREATE TABLE COMPANY
       (ID INT PRIMARY KEY     NOT NULL,
       NAME           TEXT    NOT NULL,
       AGE            INT     NOT NULL,
       ADDRESS        CHAR(50),
       SALARY         REAL);''')
>>> conn.execute("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (1, 'Paul', 32, 'California', 20000.00 )");
>>> conn.commit()
>>> conn.close()

# ex2, show data in db
>>> conn = sqlite3.connect('/root/test.db')
>>> conn.execute("select * from company")
>>> a = conn.execute("select * from company")
>>> for r in a:
...     print r
...
(1, u'Paul', 32, u'California', 20000.0)
>>>
";i:1;N;i:2;N;}i:2;i:6;}i:2;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6;}}