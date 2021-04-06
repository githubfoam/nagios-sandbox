#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "============================build nagios docker image============================================================="
    
# export IMAGE_NAME="ubuntu2004/nagios446"

cd dockerfiles 
docker build . --file Dockerfile.ubuntu2004 --tag $IMAGE_NAME
docker image ls

echo "============================build nagios docker image============================================================="
