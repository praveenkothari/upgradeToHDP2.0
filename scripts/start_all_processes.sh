export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec
#su -l hdfs -c '/usr/lib/hadoop/bin/hadoop namenode -format'
#su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh start namenode -upgrade'

su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh start namenode'
su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh start secondarynamenode'
su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh start datanode'

su - yarn -c  'export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec && /usr/lib/hadoop-yarn/sbin/yarn-daemon.sh --config /etc/hadoop/conf start resourcemanager'
su - mapred -c  'export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec && /usr/lib/hadoop-mapreduce/sbin/mr-jobhistory-daemon.sh --config /etc/hadoop/conf start historyserver'
su - yarn -c  'export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec && /usr/lib/hadoop-yarn/sbin/yarn-daemon.sh --config /etc/hadoop/conf start nodemanager'

#/usr/lib/zookeeper/bin/zkServer.sh start
su -l zookeeper -c 'source /etc/zookeeper/conf/zookeeper-env.sh; export ZOOCFGDIR=/etc/zookeeper/conf; /usr/lib/zookeeper/bin/zkServer.sh start >> $ZOOKEEPER_LOG_DIR/zoo.out'

#su -l hbase -c '/usr/lib/hbase/bin/hbase-daemon.sh start master'"
#su -l hbase -c "/usr/lib/hbase/bin/hbase-daemon.sh start regionserver"

su - hive -c  'env HADOOP_HOME=/usr JAVA_HOME=/usr/jdk/jdk1.6.0_31 /tmp/startMetastore.sh /var/log/hive/hive.out /var/log/hive/hive.log /var/run/hive/hive.pid /etc/hive/conf.server'"
su - hive -c  'env JAVA_HOME=/usr/jdk/jdk1.6.0_31 /tmp/startHiveserver2.sh /var/log/hive/hive-server2.out  /var/log/hive/hive-server2.log /var/run/hive/hive-server.pid /etc/hive/conf.server'"
su -l hcat -c '/usr/lib/hcatalog/sbin/webhcat_server.sh start'
#su -l oozie -c '/usr/lib/oozie/bin/oozied.sh start'

#service hdp-gmetad start
#service hdp-gmond start

#ambari-server start
#service nagios start