#!/bin/bash


ip_list=ip_full
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to $ip \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < deletehadoop.sh
	if [ $? -ne 0 ]; then echo "failed update in $ip \n" ; else echo "successful update in $ip " ; fi
	printf '\n'

done
