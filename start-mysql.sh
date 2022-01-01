#!/bin/sh -x

docker run --name mysql -v $(pwd)/.datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -d mysql

#docker-compose start
#echo 'start mysql workbench'
#mysql-workbench-community
