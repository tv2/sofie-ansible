#!/bin/bash
source set-environment.sh

cd tv2-sofie-blueprints-inews

echo "Fetchig updates"
git fetch --all

read -e -p "Ref to deploy: " -i "origin/develop" REF
read -e -p "Skip running tests: " -i "N" SKIP_TESTS

BUILD_COMMAND="build"
if [[ $SKIP_TESTS == y* ]] || [[ $SKIP_TESTS == Y* ]]; then
        BUILD_COMMAND="build-now"
fi

git reset --hard
git checkout --detach $REF

# run the commands in docker
echo "Running build & deploy"
sudo docker run --rm -it \
        --name blueprint-build \
        -w /src \
        --user 1000:1000 \
        -v $PWD:/src \
        -v $HOME/.npm:/home/node/.npm \
        -v $HOME/.cache/yarn:/home/node/.cache/yarn \
        -e "HTTP_PROXY=$HTTP_PROXY" \
        node:8 bash -c "yarn && HTTP_PROXY= yarn $BUILD_COMMAND --env.server=\"http://$ENV_SERVER\""
