#-*- coding: utf-8 -*- 
from exchangelib import DELEGATE, Account, Credentials,EWSTimeZone,EWSDateTime

creds = Credentials(
        username='ift.local\\jerry.cheng', 
        password='infor@135')
account = Account(primary_smtp_address='jerry.cheng@infortrend.com',
        credentials=creds, 
        autodiscover=True, 
        access_type=DELEGATE)

print account
print type(account.drafts)
# Print inbox contents in reverse order
for item in account.drafts.all().order_by('-datetime_received'):
    #print(item.subject, item.body, item.attachments)
    pass

year, month, day = 2016, 11, 10
tz = EWSTimeZone.timezone('UTC')

print tz.localize(EWSDateTime(year, month, day + 10))
print tz.localize(EWSDateTime(year, month, day))

items = account.calendar.filter(
    start__gt=tz.localize(EWSDateTime(year, month, day + 1)),
    )
print len(items)
for item in items:
    #print (item.subject, item.body, item.attachments)
    print item.subject.encode("utf-8")

