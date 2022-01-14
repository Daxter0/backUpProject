#!/bin/bash 

D=$DATE
DAY=$(date -d "$D" '+%d')
MONTH=$(date -d "$D" '+%m')
projectName=$MONGO_USER
projectName=${projectName%_*} 

# Variables à set #

#projectName=vistoo
#password=

###################

cd ~

expect <<EOF
spawn sftp xxxx@xxxx
set timeout -1
#expect "password:"
#send "$password\n"
#expect "sftp>"
#send "your command"
expect "sftp>"
send "put -r backUp$projectName$DAY'_'$MONTH\n"
expect "sftp>"
send "exit\n"
EOF