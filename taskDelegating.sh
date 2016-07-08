#! /bin/bash
NoOfWeb=$1
NoOfVideo=$2
./taskIpList.py ip.csv $NoOfWeb $NoOfVideo
./clearKnownHosts.sh
./addKnownHosts.sh
./cpidpubAll.sh ip_all.txt
./setRouteAll.sh ip_all.txt
