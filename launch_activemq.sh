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

if [ 1 -eq $(docker ps -a | grep mq4 | wc -l) ];
then
  docker rm -f mq4
fi

if [ 1 -eq $(docker ps -a | grep mq5 | wc -l) ];
then
  docker rm -f mq5
fi

docker run --platform="linux/amd64" -d -p  50001:61613 -p 60001:61616 -p 40001:8161 --name mq1 --network $PROJECT_NETWORK -i rmohr/activemq
docker run --platform="linux/amd64" -d -p  50002:61613 -p 60002:61616 -p 40002:8161 --name mq2 --network $PROJECT_NETWORK -i rmohr/activemq
docker run --platform="linux/amd64" -d -p  50003:61613 -p 60003:61616 -p 40003:8161 --name mq3 --network $PROJECT_NETWORK -i rmohr/activemq
docker run --platform="linux/amd64" -d -p  50004:61613 -p 60004:61616 -p 40004:8161 --name mq4 --network $PROJECT_NETWORK -i rmohr/activemq
docker run --platform="linux/amd64" -d -p  50005:61613 -p 60005:61616 -p 40005:8161 --name mq5 --network $PROJECT_NETWORK -i rmohr/activemq

