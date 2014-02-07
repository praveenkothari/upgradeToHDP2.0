# Set Hadoop-specific environment variables here.

# The only required environment variable is JAVA_HOME.  All others are
# optional.  When running a distributed configuration it is best to
# set JAVA_HOME in this file, so that it is correctly defined on
# remote nodes.

# The java implementation to use.  Required.
export JAVA_HOME=/usr/jdk/jdk1.6.0_31
export HADOOP_HOME_WARN_SUPPRESS=1

# Hadoop Configuration Directory
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-/etc/hadoop/conf}


# Path to jsvc required by secure HDP 2.0 datanode
export JSVC_HOME=/usr/libexec/bigtop-utils


# Heap sizes
export HADOOP_NAMENODE_HEAPSIZE="-Xms2G -Xmx2G"
#export HADOOP_JOBTRACKER_HEAPSIZE="-Xms2G -Xmx2G"
export HADOOP_DATANODE_HEAPSIZE="-Xmx2G"
#export HADOOP_TASKTRACKER_HEAPSIZE="-Xmx2G"
export HADOOP_CLIENT_HEAPSIZE="-Xmx1G"

# Extra Java runtime options.  Empty by default.
export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true ${HADOOP_OPTS}"

export HADOOP_GC_OPTS="-XX:+UseConcMarkSweepGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/log/hadoop/$USER/ -Xloggc:/var/log/hadoop/$USER/gc.log-`date +'%Y%m%d%H%M'` -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:ErrorFile=/var/log/hadoop/$USER/hs_err_pid%p.log"

# Command specific options appended to HADOOP_OPTS when specified
export HADOOP_NAMENODE_OPTS="-server -XX:ParallelGCThreads=8 -XX:CMSInitiatingOccupancyFraction=70 -XX:NewSize=1G -XX:MaxNewSize=1G  -Dhadoop.security.logger=INFO,DRFAS -Dhdfs.audit.logger=INFO,DRFAAUDIT ${HADOOP_NAMENODE_HEAPSIZE} ${HADOOP_GC_OPTS} ${HADOOP_OPTS} ${HADOOP_NAMENODE_OPTS}"
#HADOOP_JOBTRACKER_OPTS="-server -XX:ParallelGCThreads=8 -XX:CMSInitiatingOccupancyFraction=70 -XX:NewSize=200m -XX:MaxNewSize=200m  -Dhadoop.security.logger=INFO,DRFAS -Dmapred.audit.logger=INFO,MRAUDIT -Dhadoop.mapreduce.jobsummary.logger=INFO,JSA ${HADOOP_JOBTRACKER_HEAPSIZE} ${HADOOP_GC_OPTS} ${HADOOP_OPTS} ${HADOOP_JOBTRACKER_OPTS}"

#HADOOP_TASKTRACKER_OPTS="-server -Dhadoop.security.logger=ERROR,console -Dmapred.audit.logger=ERROR,console ${HADOOP_TASKTRACKER_HEAPSIZE} ${HADOOP_GC_OPTS} ${HADOOP_OPTS} ${HADOOP_TASKTRACKER_OPTS}"
HADOOP_DATANODE_OPTS="-Dhadoop.security.logger=ERROR,DRFAS ${HADOOP_OPTS} ${HADOOP_DATANODE_HEAPSIZE} ${HADOOP_GC_OPTS} ${HADOOP_DATANODE_OPTS}"
HADOOP_BALANCER_OPTS="-server -Xmx1024m ${HADOOP_BALANCER_OPTS}"

export HADOOP_SECONDARYNAMENODE_OPTS="-server -XX:ParallelGCThreads=8 -XX:NewSize=640m -XX:MaxNewSize=640m  -Dhadoop.security.logger=INFO,DRFAS -Dhdfs.audit.logger=INFO,DRFAAUDIT ${HADOOP_NAMENODE_HEAPSIZE} ${HADOOP_OPTS} ${HADOOP_GC_OPTS} ${HADOOP_SECONDARYNAMENODE_OPTS}"

# The following applies to multiple commands (fs, dfs, fsck, distcp etc)
export HADOOP_CLIENT_OPTS="${HADOOP_CLIENT_HEAPSIZE} ${HADOOP_CLIENT_OPTS}"
#HADOOP_JAVA_PLATFORM_OPTS="-XX:-UsePerfData ${HADOOP_JAVA_PLATFORM_OPTS}"

# On secure datanodes, user to run the datanode as after dropping privileges
export HADOOP_SECURE_DN_USER=hdfs

# Extra ssh options.  Empty by default.
export HADOOP_SSH_OPTS="-o ConnectTimeout=5 -o SendEnv=HADOOP_CONF_DIR"

# Where log files are stored.  $HADOOP_HOME/logs by default.
export HADOOP_LOG_DIR=/var/log/hadoop/$USER
export MAPRED_LOG_DIR=/var/log/hadoop-mapreduce/$USER

# Where log files are stored in the secure data environment.
export HADOOP_SECURE_DN_LOG_DIR=/var/log/hadoop/$HADOOP_SECURE_DN_USER

# File naming remote slave hosts.  $HADOOP_HOME/conf/slaves by default.
# export HADOOP_SLAVES=${HADOOP_HOME}/conf/slaves

# host:path where hadoop code should be rsync'd from.  Unset by default.
# export HADOOP_MASTER=master:/home/$USER/src/hadoop

# Seconds to sleep between slave commands.  Unset by default.  This
# can be useful in large clusters, where, e.g., slave rsyncs can
# otherwise arrive faster than the master can service them.
# export HADOOP_SLAVE_SLEEP=0.1

# The directory where pid files are stored. /tmp by default.
export HADOOP_PID_DIR=/var/run/hadoop/$USER
export HADOOP_SECURE_DN_PID_DIR=/var/run/hadoop/$HADOOP_SECURE_DN_USER

# History server pid
export HADOOP_MAPRED_PID_DIR=/var/run/hadoop-mapreduce/$USER

YARN_RESOURCEMANAGER_OPTS="-Dyarn.server.resourcemanager.appsummary.logger=INFO,RMSUMMARY"

# A string representing this instance of hadoop. $USER by default.
export HADOOP_IDENT_STRING=$USER

# The scheduling priority for daemon processes.  See 'man nice'.

# export HADOOP_NICENESS=10

# Use libraries from standard classpath
JAVA_JDBC_LIBS=""
#Add libraries required by mysql connector
for jarFile in `ls /usr/share/java/*mysql* 2>/dev/null`
do
  JAVA_JDBC_LIBS=${JAVA_JDBC_LIBS}:$jarFile
done
#Add libraries required by oracle connector
for jarFile in `ls /usr/share/java/*ojdbc* 2>/dev/null`
do
  JAVA_JDBC_LIBS=${JAVA_JDBC_LIBS}:$jarFile
done
#Add libraries required by nodemanager
MAPREDUCE_LIBS=/usr/lib/hadoop-mapreduce/*
export HADOOP_CLASSPATH=${HADOOP_CLASSPATH}${JAVA_JDBC_LIBS}:${MAPREDUCE_LIBS}

# Setting path to hdfs command line
export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec

#Mostly required for hadoop 2.0
export JAVA_LIBRARY_PATH=${JAVA_LIBRARY_PATH}:/usr/lib/hadoop/lib/native/Linux-amd64-64