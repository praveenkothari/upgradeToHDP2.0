#!/bin/bash

echo "HDFS*****************************************************************************";
ps -ef | grep hadoop | grep -P  'namenode|datanode|secondarynamenode';
echo "YARN*****************************************************************************";
ps -ef | grep -P 'resourcemanager|nodemanager|jobhistoryserver'; 
