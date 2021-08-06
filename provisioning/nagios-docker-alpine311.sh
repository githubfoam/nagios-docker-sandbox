#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "===================================================================================="
                          hostnamectl status
echo "===================================================================================="
echo "         \   ^__^                                                                  "
echo "          \  (oo)\_______                                                          "
echo "             (__)\       )\/\                                                      "
echo "                 ||----w |                                                         "
echo "                 ||     ||                                                         "
echo "===================================================================================="

cd ~
pwd
whoami
cp -R /vagrant/dockerfiles/ . && ls -laiR
cd dockerfiles/1/
docker version 
docker image ls 
docker build -t alpine311:nagios446 . --file=Dockerfile.alpine311
sleep 5
docker image ls 
docker run -d   --name nagioswebp80   -v $(pwd)/nagios/etc/:/opt/nagios/etc/   -v $(pwd)/nagios/var:/opt/nagios/var/   -v $(pwd)/nagios/ssmtp:/etc/ssmtp/   -v $(pwd)/nagios/:/opt/Custom-Nagios-Plugins   -p 80:80   -e "TZ=Asia/Paris"   alpine311:nagios446
sleep 5
docker container ls