#!/bin/bash

tmp_dir=/tmp
docker_dir=/data

curl -s -o ${tmp_dir}/docker-compose.yml https://raw.githubusercontent.com/rvanbutselaar/raspberrypi/main/docker-compose.yml

if diff -u ${docker_dir}/docker-compose.yml ${tmp_dir}/docker-compose.yml; then
    echo "docker-compose NOT changed"
else
    echo "docker-compose changed, copy file and reload Docker"
    cp ${tmp_dir}/docker-compose.yml ${docker_dir}/docker-compose.yml
    rm ${tmp_dir}/docker-compose.yml
    docker-compose -f ${docker_dir}/docker-compose.yml up -d
fi
