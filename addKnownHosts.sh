#! /bin/bash
source connection.conf
all_ip="ip_all.txt"
arr=()
echo 'Adding known hosts ...'
while IFS='' read -r line || [[ -n "$line" ]]; do
        arr+=(${line})
	#echo $line
done < $all_ip
for element in ${arr[@]};do
	echo $element
	ssh-keyscan $element >> ~/.ssh/known_hosts
done
echo 'Done'
echo
