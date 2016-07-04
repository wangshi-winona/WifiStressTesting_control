#! /usr/bin/python
import linecache
import sys
ip_file=sys.argv[1]
webNum=int(sys.argv[2])
videoNum=int(sys.argv[3])
print 'No. of Pi for web task: '+str(webNum)
print 'No. of Pi for video task: '+str(videoNum)
web_ip='ip_web.txt'
video_ip='ip_video.txt'
all_ip='ip_all.txt'
lines=linecache.getlines(ip_file)
with open(all_ip,'wb') as f:
	for i in range(0,len(lines)):
		ip=lines[i].split(',')[1]
		f.write(ip)
with open(web_ip,'wb') as f:
	for i in range(0,webNum):
		ip=lines[i].split(',')[1]
		f.write(ip)
with open(video_ip,'wb') as f:
	for i in range(webNum,webNum+videoNum):
		ip=lines[i].split(',')[1]
		f.write(ip)
