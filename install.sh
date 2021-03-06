#!/bin/bash
HADOOP_USER=hdpusr
HADOOP_GROUP=hadoop
CUR_DIR=$(cd $(dirname "$0") && pwd)
DASH="####################"
## Instalar Oracle JDK
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
echo "$DASH Instalando Java $DASH"
apt-get install oracle-java7-installer -y
echo "$DASH Java instalado $DASH"
java -version
echo "$DASH Creando usuario... $DASH"
sh $CUR_DIR/scripts/create_hdp_usr.sh $HADOOP_USER $HADOOP_GROUP
#Agregar sudoer?? no lo veo necesario
#echo "$HADOOP_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "$DASH Usuario $HADOOP_USER creado en el grupo $HADOOP_GROUP $DASH"
sleep 5s
cat $CUR_DIR/cfg/hdp_usr.bashrc >> /home/hdpusr/.bashrc
echo "$DASH Generando passphrase $DASH"
su hdpusr -c "ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa"
su hdpusr -c "cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys"
echo "$DASH passphrase Ok, recuerde hacer 'ssh localhost' $DASH"
sleep 5s
echo "$DASH Descargando y extrayendo Hadoop $DASH"
#Get Hadoop and install it
su - hdpusr -c "sh $CUR_DIR/scripts/hadoop_install.sh"
