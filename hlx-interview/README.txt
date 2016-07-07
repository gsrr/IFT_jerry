All code in C/C++.

Problem 1:
- FTD packets are recorded in alltraffic.pcap. 
- jr16-2014.pdf describes a rough guideline for how FTD packets are structured. However, this documentation is only a guideline, the actual implementation is slightly different.
- libCFFEXTrader.so is the actual library to parse FTD packets, so please use that as a reference. There are no header files, so please use binary inspection tools.

Please use libpcap to write a parser to  retrieve the "OrderStatus" and "UserOrderLocalID" fields from inbound CFTDOrderField packets (inbound only) into a CSV file with the following headers:

  Timestamp, UserOrderLocalID, OrderStatus

Problem 2:
Please write a single threaded application that listens to callbacks from stdin and a 5 second heartbeat timer.
- On the 5 second heartbeat timer, please print the time in HH:MM:SS.mmm format.
- On stdin, please print the string entered in all caps.

 