#! /bin/bash
source ./test.conf
all_ip_file='ip_all.txt'
web_ip_file='ip_web.txt'
video_ip_file='ip_video.txt'

#video task
./multissh_video.sh ${video_ip_file} $serverIp $eid $location &
echo "Start video"
echo "Wait 20s for launching firefox driver"
sleep 20
#web task
echo "Start web"
./multissh_web.sh ${web_ip_file} $interval $numOfLinks $eid $location &
#trtcp
echo "Start trtcp"
for i in {1}
do
	./multissh_trtcp.sh ${all_ip_file} $numOfObj $proberPerSec $probeRate $eid $location &
	#sleep 60
done
