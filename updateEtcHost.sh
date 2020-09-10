#!/bin/bash
#####################################################
# Author: Lakshmi J Mohan
# 14/6/2020

#Script called by configEtcHost.sh to modify /etc/hosts
#file of instances

#####################################################

sudo sed -i '1,100d' /etc/hosts
echo -ne "- Appending ip and hostname to /etc/hosts \t"
val=$(<newhosts)
sudo echo "$val" | sudo tee --append /etc/hosts
if [ $? -ne 0 ]; then echo "failed append \n"; else echo "successful append \n"; fi
