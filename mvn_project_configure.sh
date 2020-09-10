#!/bin/bash

#####################################################
# Author: Lakshmi J Mohan
# 30/7/2020

#Script to configure all the Oracle Cloud instances
#with the new version of our Hadoop project

#Dependency: deletehadoop.sh, untar.sh, create_dir.sh, createdir_slaves.sh
#Also ip_full, ip_master and ip_slaves files
#####################################################



echo "To hadoop directory dist of the compiled project..."
sleep 3
cd /home/hduser/Documents/Our_Project/hadoop-3.0.0-src/hadoop-dist/target/


echo "Moving project tar to required destination directory..."
sleep 3
mv hadoop-3.0.0.tar.gz /home/hduser/Documents/Our_Project/After_Build_Hadoop/


echo "To the directory to change conf files...."
sleep 3
cd /home/hduser/Documents/Our_Project/After_Build_Hadoop/


echo "Untar project...."
sleep 3
sudo tar -xzvf hadoop-3.0.0.tar.gz

echo "Deleting old conf files...."
sleep 3
cd hadoop-3.0.0/etc/
sudo rm -r hadoop

echo "Copying conf files required for our Oracle cluster...."
sleep 3
cp -r /home/hduser/Documents/Our_Project/Conf_OurProject/hadoop .


echo "Back to the directory to tar project for distribution...."
sleep 3
cd /home/hduser/Documents/Our_Project/After_Build_Hadoop/

echo "Compresssing project to a tar file..."
sleep 3
sudo tar -zcvf /home/hduser/Documents/bash\ scripts/hadoop-3.0.0.tar.gz hadoop-3.0.0


echo "Deleting OLD hadoop project's tar and the project from all the nodes..."
sleep 3
cd /home/hduser/Documents/bash\ scripts/
ip_list=ip_all5
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to node $ip \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < deletehadoop.sh
	if [ $? -ne 0 ]; then echo "failed update in $ip \n" ; else echo "successful update in $ip " ; fi
	printf '\n'

done


echo "Copying new hadoop project's tar to nodes..."
sleep 3
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to node $ip \n"
	sshpass -p "" scp hadoop-3.0.0.tar.gz hduser@$ip:/home/hduser
	if [ $? -ne 0 ]; then echo "failed copying tar in $ip \n" ; else echo "successful copy of tar in $ip " ; fi
	printf '\n'
done
sleep 3

echo "Untar new hadoop project at nodes..."
sleep 3
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to node $ip \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < untar.sh
	if [ $? -ne 0 ]; then echo "failed to untar project in $ip \n" ; else echo "successful untar of project in $ip " ; fi
	printf '\n'
done
sleep 3

echo "Deleting namenode and secondary namenode directories of masternode..."
ip_list=ip_master
sleep 3
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to node $ip \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < createdir.sh
	if [ $? -ne 0 ]; then echo "failed update in $ip \n" ; else echo "successful update in $ip " ; fi
	printf '\n'

done
sleep 3

echo "Deleting hadoop directories of the slave instances...."
ip_list=ip_slaves_5
sleep 3
for ip in $(cat $ip_list)
do
	echo -ne "Connecting to node $ip \n"
	sshpass -p "" ssh -o 'StrictHostKeyChecking=no' hduser@$ip 'bash -s' < createdir_slaves.sh
	if [ $? -ne 0 ]; then echo "failed update in $ip \n" ; else echo "successful update in $ip " ; fi
	printf '\n'

done
sleep 3

echo "OUR ORACLE CLUSTER IS NOW CONFIGURED WITH THE LATEST VERSION OF THE PROJECT :) "
echo "PLEASE MAKE SURE THAT THE FILESYSTEM IS FORMATTED BEFORE STARTING THE CLUSTER... "
sleep 2


