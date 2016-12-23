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

'''
items = account.calendar.filter(
    start__gt=tz.localize(EWSDateTime(year, month, day + 1)),
    )
print len(items)
for item in items:
    print item.subject.encode("utf-8")

items = account.inbox.filter(subject__contains='Debby')
print len(items)
for item in items:
    print item.subject.encode("utf-8")

n = account.inbox.all().count()
print n

all_subjects = account.inbox.all().values_list('subject', flat=True)
for subject in all_subjects:
    print subject

items = account.calendar.filter(start__range=(tz.localize(EWSDateTime(2016, 1, 1)), tz.localize(EWSDateTime(2017, 1, 1))))
for item in items:
    print item.subject.encode("utf-8")

items = account.inbox.filter(subject__contains='Debby')
print len(items)
for item in items:
    print item.subject.encode("utf-8")
    print dir(item)
    print item.datetime_received
'''

items = account.inbox.filter(datetime_received__range=(tz.localize(EWSDateTime(2016, 12, 22)), tz.localize(EWSDateTime(2016, 12, 23))))
print len(items)
for item in items:
    print item.subject.encode("utf-8")

