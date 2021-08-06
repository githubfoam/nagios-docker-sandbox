#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "===================================================================================="
echo "                          docker install started                                    "
echo "===================================================================================="


# https://docs.docker.com/engine/install/centos/
# Uninstall old versions
yum remove docker \
           docker-client \
           docker-client-latest \
           docker-common \
           docker-latest \
           docker-latest-logrotate \
           docker-logrotate \
           docker-engine -y

yum update -y

# Install using the repository
yum install -y yum-utils
yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo

# List and sort the versions available in your repo
yum list docker-ce --showduplicates | sort -r

# Install Docker Engine
yum install docker-ce docker-ce-cli containerd.io -y

# On Linux, you can also run the following command to activate the changes to groups
newgrp docker 

# Configure Docker to start on boot
# On Debian and Ubuntu, the Docker service is configured to start on boot by default
# To automatically start Docker and Containerd on boot for other distros

docker version

# systemctl enable docker.service
# systemctl enable containerd.service

# systemctl start docker.service
# systemctl start containerd.service



# # Verify that Docker Engine is installed correctly 
# docker run hello-world



echo "===================================================================================="
echo "                          docker install finished                                   "
echo "===================================================================================="
