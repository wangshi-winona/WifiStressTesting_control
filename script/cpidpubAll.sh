#! /bin/bash
ip_file=$1
for line in $(cat ${ip_file})
do
sshpass -p "raspberry" ssh-copy-id -i ~/.ssh/id_rsa.pub pi@${line}
done
