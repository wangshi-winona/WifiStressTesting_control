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
csv_file = 'ip.csv'
with open(csv_file,'wb') as f:
	f.truncate()
while True:
	data, addr=sock.recvfrom(1024)
	print data
	if data == 'pi':
		continue
	dataArr=str(data).split(' ')
	piid = dataArr[0]
	piip = dataArr[1]
	#print piid+' '+piip
       	with open(csv_file,'a') as outfile:
               	csvwriter=csv.writer(outfile, delimiter=',')
               	csvwriter.writerow([piid,piip])
