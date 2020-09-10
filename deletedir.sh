#!/bin/bash

#####################################################
# Author: Lakshmi J Mohan
# 20/6/2020

#Script called by update_master.sh to delete and create hadoop directories of the master instance

#####################################################

#Delete name node directories before formatting for resolving clusterID issue
rm -f -r /usr/local/hadoop/hadoopData/hdfs/namenode
rm -f -r /usr/local/hadoop/hadoopData/hdfs/datanode
rm -f -r /usr/local/hadoop/hadoopData/hdfs/namesecondary

#Create new directories
mkdir -p /usr/local/hadoop/hadoopData/hdfs/datanode
mkdir -p /usr/local/hadoop/hadoopData/hdfs/namenode
mkdir -p /usr/local/hadoop/hadoopData/hdfs/namesecondary

#change ownership to hduser
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/namenode
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/datanode
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/namesecondary


#sudo chown -R hduser:hadoop /usr/local



