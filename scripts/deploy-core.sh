#!/bin/bash
source set-environment.sh

read -e -p "Tag to deploy: " -i "develop" TAG

sudo docker pull olzzon/tv-automation-server-core:$TAG
if [ $? -ne 0 ]; then
	echo "Failed to pull image. Aborting"
	exit $?
fi

sudo docker stop server-core
sudo docker rm server-core

# TODO - slack webhooks probably need the proxy?
# TODO - NTP Servers?

HOSTNAME=$(hostname)
sudo docker run --name=server-core \
	--network=$NETWORK_NAME \
	-p 127.0.0.1:8080:80/tcp \
	--restart always -d \
	-v /opt/coredisk:/opt/coredisk \
	-e 'TZ=$TIMEZONE' \
	-e 'MONGO_OPLOG_URL=mongodb://mongo:27017/local' \
	-e 'MONGO_URL=mongodb://mongo:27017/sofie' \
	-e "ROOT_URL=http://$HOSTNAME" \
	-e 'PORT=80' \
	-e 'HTTP_FORWARDED_COUNT=1' \
	olzzon/tv-automation-server-core:$TAG
if [ $? -ne 0 ]; then
        echo "Failed to run new image. Sofie is likely not running"
        exit $?
fi

echo "Deployed $TAG"
