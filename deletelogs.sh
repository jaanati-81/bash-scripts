#!/bin/bash
#####################################################
# Author: Lakshmi J Mohan
# 20/6/2020

#Script to delete hadoop log files of instances
#Dependency: dlogs.sh and ip_full.txt
#####################################################


#ip_list of nodes in the cluster; change this if you are changing the number of nodes in the cluster
ip_list=ip_full

for ip in $(cat $ip_list)
do
	echo -ne "Connecting to $ip \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < dlogs.sh
	if [ $? -ne 0 ]; then echo "created files in $ip \n" ; else echo "successful deletion of log files in $ip " ; fi
	printf '\n'
done



