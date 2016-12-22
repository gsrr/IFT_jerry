#-*- coding: utf-8 -*-
import smtplib

# Import the email modules we'll need
from email.mime.text import MIMEText

# Open a plain text file for reading.  For this example, assume that
# the text file contains only ASCII characters.
msg = MIMEText("This is a test")
me = "jerry.cheng@infortrend.com"
you = "jerry.cheng@infortrend.com"
msg['Subject'] = "test subject"
msg['From'] = me
msg['To'] = you

# Send the message via our own SMTP server, but don't include the
# envelope header.
s = smtplib.SMTP('email.infortrend.com:587')
s.ehlo()
s.starttls()
s.login("user", "password")
s.sendmail(me, [you], msg.as_string())
s.quit()
