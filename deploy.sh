PROJECT_NETWORK='final-network'
SERVER_IMAGE='final-server-image'
SERVER_CONTAINER='my-server'
CLIENT_IMAGE='final-client-image'
CLIENT_CONTAINER='my-client'
mq_docker_name='final-mq'

# clean up existing resources, if any
echo "----------Cleaning up existing resources----------"
docker container stop $SERVER_CONTAINER 2> /dev/null && docker container rm $SERVER_CONTAINER 2> /dev/null
docker container stop $CLIENT_CONTAINER 2> /dev/null && docker container rm $CLIENT_CONTAINER 2> /dev/null
docker network rm $PROJECT_NETWORK 2> /dev/null

# only cleanup
if [ "$1" == "cleanup-only" ]
then
  exit
fi

# create a custom virtual network
echo "----------creating a virtual network----------"
docker network create $PROJECT_NETWORK

# build the images from Dockerfile
echo "----------Building images----------"
mvn install -Dmaven.test.skip=true
docker build . -t $SERVER_IMAGE

./launch_activemq.sh
#docker build -t $CLIENT_IMAGE --target client-build .
