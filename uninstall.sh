#!/bin/bash
HADOOP_USER=hdpusr
HADOOP_GROUP=hadoop
rm -rf /home/hdpusr/*hadoop*
rm -rf /tmp/raspy/*
userdel -r $HADOOP_USER
groupdel $HADOOP_GROUP

