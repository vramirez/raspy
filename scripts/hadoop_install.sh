#/bin/bash
#GET HADOOP
ROOT_DIR=`dirname $0`
ROOT_DIR=$(cd ${ROOT_DIR}/.. && pwd)
JOM=/home/hdpusr
#echo "$DASH Copiando instalador de Apache Hadoop desde: $ROOT_DIR"
cp $ROOT_DIR/binaries/hadoop-*[0-9].tar.gz $JOM
mkdir current-hadoop && tar xf hadoop-*[0-9].tar.gz -C current-hadoop --strip-components 1
mkdir -p hdfs/namenode
mkdir -p hdfs/datanode
cat $ROOT_DIR/cfg/*.bashrc >> $JOM/.bashrc
cp $ROOT_DIR/cfg/*.xml $JOM/current-hadoop/etc/hadoop
cp $ROOT_DIR/cfg/hadoop-env.sh $JOM/current-hadoop/etc/hadoop

echo "NOW as $HADOOP_USER FORMAT THE NAMENODE WITH:$ hdfs namenode -format"
echo "Then start Hadoop with:$ start-dfs.sh"

