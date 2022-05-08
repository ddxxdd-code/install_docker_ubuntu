#!/usr/bin/bash
# code are obtained from https://docs.docker.com/engine/install/ubuntu/
# I combine them to rune as a script
# Copyright belongs to Docker

# apt-get update
apt-get update
# install required tools
apt-get install ca-certificates curl gnupg lsb-release
# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# set up the stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# update again with updated apt-get list
apt-get update
# install Docker engine
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# run Docker hello-world
docker run hello-world
# final check on installation
if [ $? -eq 0 ]
then
  echo success!
else
  echo "error! with code [${?}] please check."
fi
