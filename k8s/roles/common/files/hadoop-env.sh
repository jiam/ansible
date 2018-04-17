export JAVA_HOME=/export/App/jdk1.8.0_60

export HIVE_HOME=/export/App/hive-1.2.1
#export HIVE_HOME=/export/App/hive-2.1.1
export HBASE_HOME=/export/App/hbase-1.2.6
export ZOOKEEPER_HOME=/export/App/zookeeper-3.4.6

export TEZ_HOME=/export/App/apache-tez-0.8.5-bin
export TEZ_CONF_DIR=$TEZ_HOME/conf

export HADOOP_PREFIX=/export/App/hadoop-2.6.1
export HADOOP_HOME=${HADOOP_PREFIX}
export HADOOP_MAPRED_HOME=${HADOOP_HOME}
export HADOOP_COMMON_HOME=${HADOOP_HOME}
export HADOOP_HDFS_HOME=${HADOOP_HOME}
export HADOOP_YARN_HOME=${HADOOP_HOME}
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export YARN_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export HDFS_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export YARN_HOME=${HADOOP_HOME}
export JSVC_HOME=${HADOOP_HOME}/libexec

export YARN_LOG_DIR=/export/Logs/hadoop
export HADOOP_LOG_DIR=/export/Logs/hadoop
export HADOOP_MAPRED_LOG_DIR=/export/Logs/hadoop
export HBASE_LOG_DIR=/export/Logs/hbase
export ZOO_LOG_DIR=/export/Logs/zookeeper

export HADOOP_PID_DIR=/export/Logs/hadoop
export YARN_PID_DIR=/export/Logs/hadoop
export HADOOP_MAPRED_PID_DIR=/export/Logs/hadoop
export HBASE_PID_DIR=/export/Logs/hbase

#export HADOOP_CLASSPATH=${HADOOP_HOME}/lib/hadoop-lzo.jar:$HADOOP_CLASSPATH
#export JAVA_LIBRARY_PATH=${HADOOP_HOME}/lib/native:$JAVA_LIBRARY_PATH

export HADOOP_CLASSPATH=/usr/lib/hadoop/lib/hadoop-lzo.jar:$HADOOP_CLASSPATH
export JAVA_LIBRARY_PATH=/usr/lib/hadoop/lib/native:$JAVA_LIBRARY_PATH

export PATH=${MAVEN_HOME}/bin:${JAVA_HOME}/bin:${HADOOP_HOME}/bin:${HIVE_HOME}/bin:${HBASE_HOME}/bin:$PATH
