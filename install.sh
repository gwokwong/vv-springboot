#!/bin/bash
git clone https://github.com/yeqifu/warehouse.git

docker-compose build 
docker-compose up -d 


while true
do
docker-compose  exec mysql-svc mysql -uroot -p123456 -e "show databases;" && break ||  echo "error connect"
done 
cp -rf warehouse/warehouse.sql ./data

docker-compose exec mysql-svc  sh -c "mysql -uroot -p123456 warehouse  < /var/lib/mysql/warehouse.sql"




