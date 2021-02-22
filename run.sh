#!/bin/bash

host=$1
port=$2
username=$3
password=$4
db=$5
nomeBackup=$db-$(date +%Y-%m-%d)
docker run --rm -it -e PGPASSWORD=$password postgres:alpine pg_dump  -h $host -p $port -U $username $db > $nomeBackup.sql
tar -czvf $nomeBackup.tar.gz $nomeBackup.sql
rm $nomeBackup.sql
