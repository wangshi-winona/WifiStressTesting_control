import socket
import csv
UDP_IP=''
UDP_PORT=10100
#MESSAGE = "pi"
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
sock.bind((UDP_IP, UDP_PORT))

#sock.sendto(MESSAGE, (UDP_IP, UDP_PORT))
while True:
	data, addr = sock.recvfrom(1024)
	print data
	tempArr = data.split(' ')
	piid = tempArr[0]
	piip = tempArr[1]
	#piip = 'new ip'

	found = False
	outdate = False
	with open('ip.csv','rb') as csvfile:
        	r=csv.reader(csvfile,delimiter=',')
        	content=list(row for row in r)
#        	print content
        	for row in content:
                	if piid == row[0]:
                        	found = True
                        	if piip != row[1]:
                                	row[1]=piip
                                	outdate = True
                                	print content
                        	break
	if (found == False):
		with open('ip.csv','a') as outfile:
			csvwriter=csv.writer(outfile, delimiter=',')
			csvwriter.writerow([piid,piip])
	else:
		if outdate:
			with open('ip.csv','w') as outfile:
				csvwriter=csv.writer(outfile, delimiter=',')
				for row in content:
					csvwriter.writerow(row)
	print found
	print outdate	

