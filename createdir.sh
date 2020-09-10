#!/bin/bash

#####################################################
# Author: Lakshmi J Mohan
# 20/7/2020

#Script called by mvn_project_configure.sh to create hadoop directories of the master instance

#####################################################


#Create new directories
mkdir -p /usr/local/hadoop/hadoopData/hdfs/datanode
mkdir -p /usr/local/hadoop/hadoopData/hdfs/namenode
mkdir -p /usr/local/hadoop/hadoopData/hdfs/namesecondary

#change ownership to hduser
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/namenode
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/datanode
chown -R hduser:hadoop /usr/local/hadoop/hadoopData/hdfs/namesecondary


#sudo chown -R hduser:hadoop /usr/local



