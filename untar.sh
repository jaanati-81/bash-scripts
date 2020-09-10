#!/bin/bash
#untar

#echo -ne "Copy Hadoop tar at slave - \n"
#sshpass -p "" scp hadoop_madiator.tar.gz hduser@$ip:/usr/local
#sudo rm -r /usr/local/hadoop_mxor_hc.tar.gz
#sudo rm -r /usr/local/hadoop/conf
#sudo rm -r /usr/local/hadoop/build/contrib/raid/hadoop-0.20-fb-hduser-raid.jar
#sudo rm -r /usr/local/hadoop
#if [ $? -ne 0 ]; then echo "Copy  FAIL"; else echo "Copy OK"; fi
echo -ne "Untar Hadoop at instance \n"
sudo tar -xzvf /home/hduser/hadoop-3.0.0.tar.gz 
sudo mkdir /usr/local/hadoop
sudo mv -v hadoop-3.0.0/* /usr/local/hadoop
sudo chown -R hduser:hadoop /usr/local/hadoop
if [ $? -ne 0 ]; then echo "Untar  FAIL"; else echo "Untar OK"; fi
