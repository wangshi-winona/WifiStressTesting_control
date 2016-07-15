#! /bin/bash
ip_file=$1
echo 'Setting remote route ...'
for line in $(cat ${ip_file})
do
	ssh pi@${line} 'sudo /home/pi/task/script/setRoute.sh'
done
echo 'Done'
echo
