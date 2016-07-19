#! /bin/bash
source connection.conf
NoOfWeb=$1
NoOfVideo=$2
./taskIpList.py ip.csv $NoOfWeb $NoOfVideo
./clearKnownHosts.sh
./addKnownHosts.sh
./cpidpubAll.sh ip_all.txt
if ! ${controlUsingWireless}; then
	./setRouteAll.sh ip_all.txt
fi
