#!/bin/bash

mkdir /home/yarn
mkdir /home/hive
mkdir /home/hbase
mkdir /home/oozie
mkdir /home/hcat
mkdir /home/hdfs
mkdir /home/mapred

useradd -s /bin/bash -d /home/yarn -g hadoop yarn
useradd -s /bin/bash -d /home/hdfs -g hadoop hdfs
useradd -s /bin/bash -d /home/mapred -g hadoop mapred
useradd -s /bin/bash -d /home/hbase -g hadoop hbase
useradd -s /bin/bash -d /home/hive -g hadoop hive
useradd -s /bin/bash -d /home/hcat -g hadoop hcat
useradd -s /bin/bash -d /home/oozie -g hadoop oozie
useradd -s /bin/bash -d /var/run/zookeeper -g hadoop zookeeper
