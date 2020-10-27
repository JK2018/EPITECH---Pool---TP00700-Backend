#!/bin/bash
#Get servers list
set -f
# string=$DEPLOY_SERVER
array=(${string//,/ })
#Iterate servers for deploy and pull last commit
for i in "${!array[@]}"; do
    echo "Deploy project on server ${array[i]}"
    ssh ubuntu@ip-172-31-86-39 "cd /var/www && git pull origin master && docker-compose build && docker-compose up"
done