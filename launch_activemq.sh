docker pull rmohr/activemq
PROJECT_NETWORK="final-network"
mq_docker_name="$1"
mq_port="$2"

if [ 1 -eq $(docker ps -a | grep ${mq_docker_name} | wc -l) ];
then
  docker rm -f ${mq_docker_name}
fi
docker run --platform="linux/amd64" \
--name $1 \
-p $2:61616 \
--network $PROJECT_NETWORK \
-d -i rmohr/activemq