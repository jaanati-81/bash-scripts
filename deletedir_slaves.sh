#!/bin/bash

#####################################################
# Author: Lakshmi J Mohan
# 20/6/2020

#Script called by update_slaves.sh to delete and create hadoop directories of the slave instances

#####################################################

#Delete data node directory 
rm -f -r /usr/local/hadoop/hadoopData/hdfs/datanode

#Create new directories
mkdir -p /usr/local/hadoop/hadoopData/hdfs/datanode

#change ownership to hduser
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/datanode


