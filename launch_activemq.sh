docker pull rmohr/activemq
PROJECT_NETWORK="final-network"

if [ 1 -eq $(docker ps -a | grep mq1 | wc -l) ];
then
  docker rm -f mq1
fi

if [ 1 -eq $(docker ps -a | grep mq2 | wc -l) ];
then
  docker rm -f mq2
fi

if [ 1 -eq $(docker ps -a | grep mq3 | wc -l) ];
then
  docker rm -f mq3
fi

docker run --platform="linux/amd64" -d -p  5001:61613 -p 60001:61616 -p 7001:8161 --name mq1 --network $PROJECT_NETWORK -i rmohr/activemq
docker run --platform="linux/amd64" -d -p  5002:61613 -p 60002:61616 -p 7002:8161 --name mq2 --network $PROJECT_NETWORK -i rmohr/activemq
docker run --platform="linux/amd64" -d -p  5003:61613 -p 60003:61616 -p 7003:8161 --name mq3 --network $PROJECT_NETWORK -i rmohr/activemq

