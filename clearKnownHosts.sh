#! /bin/bash
echo 'Truncating known hosts ...'
truncate -s 0 '/root/.ssh/known_hosts'
echo 'Done'
echo 
