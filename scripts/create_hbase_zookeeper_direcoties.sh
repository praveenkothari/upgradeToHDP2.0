#!/bin/bash

#Mkdir for hbase and zookeeper
mkdir -p $HBASE_LOG_DIR; 
chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_LOG_DIR; 
chmod -R 755 $HBASE_LOG_DIR;
mkdir -p $HBASE_PID_DIR; 
chown -R $HBASE_USER:$HADOOP_GROUP  $HBASE_PID_DIR; 
chmod -R 755  $HBASE_PID_DIR;
mkdir -p $ZOOKEEPER_LOG_DIR; 
chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_LOG_DIR; 
chmod -R 755 $ZOOKEEPER_LOG_DIR;
mkdir -p $ZOOKEEPER_PID_DIR; 
chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_PID_DIR; 
chmod -R 755 $ZOOKEEPER_PID_DIR;
mkdir -p $ZOOKEEPER_DATA_DIR; 
chmod -R 755 $ZOOKEEPER_DATA_DIR; 
chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_DATA_DIR;

