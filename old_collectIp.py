#! /usr/bin/python
import socket
import sys
import csv
UDP_IP='255.255.255.255'
UDP_PORT=7070
sock=socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
sock.bind(('',UDP_PORT))
sock.sendto('pi',(UDP_IP,UDP_PORT))

while True:
	data, addr=sock.recvfrom(1024)
	print data
	if data == 'pi':
		continue
	dataArr=str(data).split(' ')
	piid = dataArr[0]
	piip = dataArr[1]
	#print piid
	#print piip
	found = False
	outdate = False
	csv_file = 'ip.csv'
	with open(csv_file,'rb') as csvfile:
        	r=csv.reader(csvfile,delimiter=',')
        	content=list(row for row in r)
		#print content
        	for row in content:
                	if piid == row[0]:
                       		found = True
                       		if piip != row[1]:
                                	row[1]=piip
                                	outdate = True
                                	print content
                                	break
	if (found == False):
        	with open(csv_file,'a') as outfile:
                	csvwriter=csv.writer(outfile, delimiter=',')
                	csvwriter.writerow([piid,piip])
	else:
	        if outdate:
        	        with open(csv_file,'w') as outfile:
                	        csvwriter=csv.writer(outfile, delimiter=',')
                        	for row in content:
                                	csvwriter.writerow(row)
	print 'found:'+str(found)
	print 'update:'+str(outdate)
