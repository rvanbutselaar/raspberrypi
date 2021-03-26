#!/bin/bash
sudo ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
sudo apt update && sudo apt upgrade -y
sudo apt-get install vim docker-compose -y
curl -sSL https://get.docker.com | sh
sudo mkdir /data/prometheus/config
