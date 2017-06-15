import sqlite3
import sys
import string
import random


def create():
	db_path = sys.argv[2]
	data_num = int(sys.argv[3])
	conn = sqlite3.connect(db_path)
	conn.execute('''CREATE TABLE COMPANY
		   (ID INT PRIMARY KEY     NOT NULL,
		   NAME           TEXT    NOT NULL,
		   AGE            INT     NOT NULL,
		   ADDRESS        CHAR(50),
		   SALARY         REAL);''')
		
	for i in xrange(data_num):
		name = "".join([ random.choice(string.letters) for j in xrange(5) ])
		location = "".join([ random.choice(string.letters) for j in xrange(10) ])
		print "insert data, id=%d, name=%s, location=%s"%(i+1, name, location)
		conn.execute("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) VALUES (%d, '%s', 32, '%s', 20000.00 )"%(i+1, name, location));
	conn.commit()
	conn.close()

def show():
	db_path = sys.argv[2]
	conn = sqlite3.connect(db_path)
	data = conn.execute("select * from company")
	for r in data:
		print r
	conn.close()
 		
def main():
	func = getattr(sys.modules[__name__], sys.argv[1])
	func()

if __name__ == "__main__":
	main()
