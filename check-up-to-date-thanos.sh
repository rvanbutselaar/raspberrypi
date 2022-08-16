#!/bin/bash
image_version=$(cat docker-compose.yml | grep image: | grep thanos | awk '{print $2}' | cut -d ':' -f 2 | uniq)
latest_version=$(curl -s https://api.github.com/repos/thanos-io/thanos/releases/latest|jq -r .name)

if [ "${latest_version}" != "${image_version}" ]; then
    echo "Thanos:${image_version} is NOT up-to-date, latest version is: ${latest_version}"
    sed -i '' "s|image: quay.io/thanos/thanos:${image_version}|image: quay.io/thanos/thanos:${latest_version}|g" docker-compose.yml
else
    echo "Thanos:${image_version} is up-to-date"
fi