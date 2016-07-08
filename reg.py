#! /usr/bin/python
import sys
import csv
piid = sys.argv[1]
piip = sys.argv[2]
print piid
print piip
found = False
outdate = False
csv_file = '/home/user/videoStreamHttp/initializr/ip/ip.csv'
with open(csv_file,'rb') as csvfile:
       	r=csv.reader(csvfile,delimiter=',')
       	content=list(row for row in r)
#      	print content
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
print found
print outdate	
