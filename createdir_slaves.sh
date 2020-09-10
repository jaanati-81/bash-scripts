#!/bin/bash

#####################################################
# Author: Lakshmi J Mohan
# 20/7/2020

#Script called by mvn_project_configure.sh to create hadoop directories of the slave instances

#####################################################


#Create new directories
mkdir -p /usr/local/hadoop/hadoopData/hdfs/datanode

#change ownership to hduser
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/datanode


