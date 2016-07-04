import linecache
import sys
ip_file=sys.argv[1]
start=int(sys.argv[2])
end=int(sys.argv[3])
output_file=sys.argv[4]
lines=linecache.getlines(ip_file)
fo=open(output_file,'wb')
for i in range(start-1,end):
	fo.write(lines[i])
