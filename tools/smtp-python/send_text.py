#-*- coding: utf-8 -*-
import smtplib

# Import the email modules we'll need
from email.mime.text import MIMEText

# Open a plain text file for reading.  For this example, assume that
# the text file contains only ASCII characters.
msg = MIMEText("This is a test")
me = u"Michael.Peng(彭梓佑)@infortrend.com"
you = "jerry.cheng@infortrend.com"
msg['Subject'] = "test subject"
msg['From'] = me
msg['To'] = you

s = smtplib.SMTP('email.infortrend.com')
s.sendmail(me, [you], msg.as_string())
s.quit()
