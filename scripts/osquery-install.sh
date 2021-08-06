#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "===================================================================================="
echo "                          osquery install started                                    "
echo "===================================================================================="


curl -L https://pkg.osquery.io/rpm/GPG | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-osquery
yum-config-manager --add-repo https://pkg.osquery.io/rpm/osquery-s3-rpm.repo
yum-config-manager --enable osquery-s3-rpm-repo
yum install osquery -y

# osqueryd --verbose


echo "===================================================================================="
echo "                          osquery install finished                                   "
echo "===================================================================================="
