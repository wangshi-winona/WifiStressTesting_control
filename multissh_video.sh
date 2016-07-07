#! /bin/bash
ip_file=$1
server_ip=$2
eid=$3
location=$4
video_file='video.txt'
arr=()
while IFS='' read -r line || [[ -n "$line" ]]; do
	#echo "Read from file: $line"
	arr+=(${line})
done < $video_file
count=0
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	i=$((${count}%${#arr[@]}))
	#echo ${ip}': loading '${arr[${i}]}
	ssh pi@${ip} "sudo /home/pi/task/script/reach.sh video; sudo python /home/pi/task/py/pyselenium.py ${server_ip} ${arr[${i}]} ${eid} ${location}"&
	count=${count}+1
done < $ip_file
