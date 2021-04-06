#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "============================deploy nagios docker image============================================================="

export IMAGE_NAME="ubuntu2004/nagios446"      
export CONTAINER_NAME="nagios"

docker container ls

docker run -d                            \
--name $CONTAINER_NAME                   \
-p 80:80 -p 443:443 -p 5666:5666         \
$IMAGE_NAME

docker container ls

docker info
docker inspect $IMAGE_NAME
# docker stats 
docker stats --all --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}" $CONTAINER_NAME
docker stats --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"

# docker container logs --tail 100 nagios #Print the last 100  lines of a container’s logs

# docker logs nagios
# docker top nagios # processes of container nagios
# docker diff nagios # show all modified files of container nagios
# docker port nagios # show all mapped ports of container nagios


# docker network ls | grep "bridge"
# docker network ls #List networks

# docker volume ls

# docker container kill nagios #Stop a running container through SIGKILL 
# docker container rm -f $(docker ps) #Delete all running and   stopped containers



# netstat -tulpn 
# netstat -tunlp | grep ":80"
# netstat -plan
# netstat -plan | grep ":80"


# time curl -I http://127.0.0.1/nagios | grep HTTP # get the header for the page, and time the process
# curl -I "http://127.0.0.1/nagios" 2>&1 | grep -w "200\|301" # see if a given website is up or down


echo "============================deploy nagios docker image============================================================="
