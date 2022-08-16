#!/bin/bash
image_version=$(cat docker-compose.yml | grep image: | grep cadvisor | awk '{print $2}' | cut -d ':' -f 2 | uniq)
latest_version=$(curl -s https://api.github.com/repos/google/cadvisor/releases/latest|jq -r .name)

if [ "${latest_version}" != "${image_version}" ]; then
    echo "Cadvisor:${image_version} is NOT up-to-date, latest version is: ${latest_version}"
    sed -i '' "s|image: gcr.io/cadvisor/cadvisor:${image_version}|image: gcr.io/cadvisor/cadvisor:${latest_version}|g" docker-compose.yml
else
    echo "Cadvisor:${image_version} is up-to-date"
fi
