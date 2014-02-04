service nagios stop
service hdp-gmetad stop
service hdp-gmond stop

su -l oozie -c '/usr/lib/oozie/bin/oozied.sh stop'

su -l hcat -c '/usr/lib/hcatalog/sbin/webhcat_server.sh stop'

ps aux | awk '{print $1,$2}' | grep hive | awk '{print $2}' | xargs kill >/dev/null 2>&1

/usr/lib/zookeeper/bin/zkServer.sh stop

su -l hbase -c '/usr/lib/hbase/bin/hbase-daemon.sh stop regionserver'

su -l hbase -c '/usr/lib/hbase/bin/hbase-daemon.sh stop master'

su - yarn -c  'export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec && /usr/lib/hadoop-yarn/sbin/yarn-daemon.sh --config /etc/hadoop/conf stop nodemanager'
su - mapred -c  'export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec && /usr/lib/hadoop-mapreduce/sbin/mr-jobhistory-daemon.sh --config /etc/hadoop/conf stop historyserver'
su - yarn -c  'export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec && /usr/lib/hadoop-yarn/sbin/yarn-daemon.sh --config /etc/hadoop/conf stop resourcemanager'

su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh stop datanode'
su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh stop secondarynamenode'
su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh stop namenode'

#su -l mapred -c "/usr/lib/hadoop/bin/hadoop-daemon.sh --config /etc/hadoop/conf stop tasktracker"
#su -l mapred -c "/usr/lib/hadoop/bin/hadoop-daemon.sh --config /etc/hadoop/conf stop historyserver"
#su -l mapred -c "/usr/lib/hadoop/bin/hadoop-daemon.sh --config /etc/hadoop/conf stop jobtracker"

#su -l hdfs -c "/usr/lib/hadoop/bin/hadoop-daemon.sh --config /etc/hadoop/conf stop datanode"
#su -l hdfs -c "/usr/lib/hadoop/bin/hadoop-daemon.sh --config /etc/hadoop/conf stop secondarynamenode"
#su -l hdfs -c "/usr/lib/hadoop/bin/hadoop-daemon.sh --config /etc/hadoop/conf stop namenode"