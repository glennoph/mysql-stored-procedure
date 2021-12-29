#!/bin/sh -x

docker-compose start
echo 'start mysql workbench'
mysql-workbench-community
