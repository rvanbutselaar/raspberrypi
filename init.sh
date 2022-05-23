#!/bin/bash
sudo ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
sudo apt update && sudo apt upgrade -y
sudo apt-get install vim docker-compose gnupg2 pass unattended-upgrades -y
gpg2 --full-generate-key
curl -sSL https://get.docker.com | sh
sudo mkdir /data/prometheus/config
echo 'cgroup_enable=memory swapaccount=1' >> /boot/cmdline.txt
