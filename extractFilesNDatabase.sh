#!/bin/bash 

D=$DATE
DAY=$(date -d "$D" '+%d')
MONTH=$(date -d "$D" '+%m')
projectName=${MONGO_USER%_*}

# Variables à set #

#projectName=vistoo
prefix=xxxx
suffixPass=xxxx
suffixUser=xxxx

###################

cd ~

mkdir backUp$projectName$DAY"_"$MONTH
# add const for suffix
mongodump -d $projectName -u $projectName$suffixUser -p $prefix_$projectName$suffixPass

zip -r database.zip dump

mv database.zip backUp$projectName$DAY"_"$MONTH

cd /var/www/uploads 

zip -r files.zip $projectName

mv files.zip ~/backUp$projectName$DAY"_"$MONTH
