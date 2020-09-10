#!/bin/bash
#####################################################
# Author: Lakshmi J Mohan
# 20/6/2020

#Script called by deletelogs.sh to delete hadoop log files of instances

#####################################################

rm -f -r /usr/local/hadoop/logs

mkdir /usr/local/hadoop/logs

chown -R hduser:hadoop /usr/local/hadoop/logs

