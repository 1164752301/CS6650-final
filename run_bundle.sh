SERVER_IMAGE='final-server-image'
PROJECT_NETWORK='final-network'

if [ $# -ne 6 ]
then
  echo "Usage: ./run_server.sh <server_docker_name> <server_port> <mysql_docker_name> <mysql_port> <mysql_mount_directory> <mq_docker_name>"
  exit
fi

server_docker_name="$1"
server_port="$2"
mysql_docker_name="$3"
mysql_docker_port="$4"
mysql_mount="$5"
mq_docker_name="$6"


if [ 1 -eq $(docker ps -a | grep ${server_docker_name} | wc -l) ];
then
  docker rm -f ${server_docker_name}
fi

deploy/sql/start_mysql_57_for_user.sh $3 $4 $5

# run client docker container with cmd args
docker run -it --rm -p $2:30001 \
--name $1 \
-e FINAL_MYSQL_PASSWORD="Y2h5d9pDa9D" \
-e FINAL_MYSQL_IP="$3" \
-e FINAL_MYSQL_PORT="3306" \
-e MQ_IP="$6" \
--network $PROJECT_NETWORK $SERVER_IMAGE \
java org.dbms.ServerApplication
# cmd to run server locally - java server.ServerApp localhost 1111
