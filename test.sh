#! /bin/bash
source ./test.conf
all_ip_file='ip_all.txt'
web_ip_file='ip_web.txt'
video_ip_file='ip_video.txt'

#video task
./multissh_video.sh ${video_ip_file} $videoServerIp $eid $location &
echo "Start video"
echo "Wait 20s for launching firefox driver"
sleep 20
#web task
echo "Start web"
./multissh_web.sh ${web_ip_file} $webInterval $numOfLinks $eid $location &
#trtcp
echo "Start trtcp"
	./multissh_trtcp.sh ${all_ip_file} $numOfObj $proberPerSec $probeRate $eid $location &
echo "Start wifi quality"
	./multissh_quality.sh ${all_ip_file} $wifiInterval $wifiRepeat $eid $location &
