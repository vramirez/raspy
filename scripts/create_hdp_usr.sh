#!/bin/bash
groupadd $2
useradd -mg $2 -s /bin/bash $1

#Rollback
#userdel -r $1
#groupdel $2

