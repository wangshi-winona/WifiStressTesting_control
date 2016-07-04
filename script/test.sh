#! /bin/bash
all_ip_file=$1
web_ip_file=$2
video_ip_file=$3
eid=$4
location=$5

#video task
./multissh_video.sh ${video_ip_file} "158.132.255.20:12481" $eid $location &
echo "Start video"
echo "Wait 20s for launching firefox driver"
sleep 20
#web task
echo "Start web"
./multissh_web.sh ${web_ip_file} 10 10 $eid $location &
#trtcp
echo "Start trtcp"
for i in {1}
do
	./multissh_trtcp.sh ${all_ip_file} 10 2 2 $eid $location &
	#sleep 60
done
