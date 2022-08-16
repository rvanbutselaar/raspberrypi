#!/bin/bash
images=$(cat docker-compose.yml | grep image: | grep -Ev "(quay|ecr|cadvisor)" | awk '{print $2}')

for i in $images; do
    IFS=': ' read -r -a array <<< "${i}"
    latest_version=$(docker run utrecht/dip:4.0.2 dip image --name="${array[0]}" --regex="(v?)([0-9]+\.){2}[0-9]+$" | tail -n1)

    if [ "${latest_version}" != "${array[1]}" ]; then
        echo "${i} is NOT up-to-date, latest version is: ${latest_version}"
        sed -i "s|image: ${i}|image: ${array[0]}:${latest_version}|g" docker-compose.yml
    else
        echo "${i} is up-to-date"
    fi
done
