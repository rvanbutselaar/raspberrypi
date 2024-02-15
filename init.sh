#!/bin/bash
sudo ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
sudo apt update && sudo apt upgrade -y
sudo apt-get install vim docker-compose gnupg2 pass unattended-upgrades amazon-ecr-credential-helper -y
curl -sSL https://get.docker.com | sh
sudo useradd prometheus -u 1001
sudo mkdir -p /data/prometheus/data
sudo chown 1001 /data/prometheus/data
sudo mkdir -p /data/prometheus/config
sudo mkdir -p /data/thanos/config
echo -n ' cgroup_enable=memory swapaccount=1' >> /boot/cmdline.txt

echo "0 10 * * * root /data/update-docker-compose.sh" > /etc/cron.d/update-docker-compose
echo "*/5 * * * * root /data/test-network.sh >> /var/log/test-network.log 2>&1" > /etc/cron.d/test-network
