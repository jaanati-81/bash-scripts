#!/bin/bash
#####################################################
# Author: Lakshmi J Mohan
# 14/6/2020

#Script to run to modify /etc/hosts file of instances
#Dependency: updateEtcHost.sh and ip_full.txt files
#####################################################

ip_list=ip_full
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to $ip \n"	
	echo -ne "Copying hosts file to slave \n"
	sshpass -p "" scp newhosts hduser@$ip:/home/hduser
	if [ $? -ne 0 ]; then echo "failed copy in $ip \n"; else echo "successful copy in $ip \n"; fi
	
	echo -ne "Updating /etc/hosts file.. \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < updateEtcHost.sh
	if [ $? -ne 0 ]; then echo "failed update in $ip \n"; else echo "successful update in $ip \n"; fi

done
