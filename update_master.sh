#!/bin/bash
#####################################################
# Author: Lakshmi J Mohan
# 20/6/2020

#Script to delete hadoop log files of the master instance
#Dependency: deletedir.sh and ip_master.txt
#####################################################

ip_list=ip_master
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to $ip \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < deletedir.sh
	if [ $? -ne 0 ]; then echo "failed update in $ip \n" ; else echo "successful update in $ip " ; fi
	printf '\n'

done
