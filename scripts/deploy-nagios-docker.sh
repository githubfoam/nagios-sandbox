#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "============================deploy nagios docker image============================================================="
    
IMAGE_NAME: "ubuntu2004/nagios44"

cd dockerfiles 
docker build . --file Dockerfile.ubuntu2004 --tag $IMAGE_NAME
docker image ls

docker run -d                            \
-p 80:80 -p 443:443 -p 5666:5666         \
$IMAGE_NAME
docker container ls

echo "============================deploy nagios docker image============================================================="
