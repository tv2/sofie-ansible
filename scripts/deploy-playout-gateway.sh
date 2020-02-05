#!/bin/bash
source set-environment.sh

read -e -p "Tag to deploy: " -i "develop" TAG

sudo docker pull olzzon/tv-automation-playout-gateway:$TAG
if [ $? -ne 0 ]; then
	echo "Failed to pull image. Aborting"
	exit $?
fi

sudo docker stop playout-gateway
sudo docker rm playout-gateway

HOSTNAME=$(hostname)
sudo docker run --name=playout-gateway \
	--network=$NETWORK_NAME \
	--restart always -d \
	-e TZ=Europe/Copenhagen \
	-e 'CORE_HOST=server-core' \
	-e 'CORE_PORT=80' \
	-e "DEVICE_ID=$HOSTNAME" \
	-e "DEVICE_TOKEN=$DEVICE_TOKEN" \
	olzzon/tv-automation-playout-gateway:$TAG
if [ $? -ne 0 ]; then
        echo "Failed to run new image. Playout-gateway is likely not running"
        exit $?
fi

echo "Deployed $TAG"
