SERVER_IMAGE='final-server-image'
PROJECT_NETWORK='final-network'

if [ $# -ne 5 ]
then
  echo "Usage: ./run_server.sh <server_docker_name> <server_port> <mysql_docker_name> <mysql_port> <mysql_mount_directory>"
  exit
fi

server_docker_name="$1"
server_port="$2"
mysql_docker_name="$3"
mysql_port="$4"
mysql_mount="$5"

deploy/sql/start_mysql_57_for_user.sh $3 $4 $5

# run client docker container with cmd args
docker run -it --rm --name $1 \
--network $PROJECT_NETWORK $SERVER_IMAGE \
-p $2:30001 \
-e FINAL_MYSQL_PASSWORD=Y2h5d9pDa9D \
-e FINAL_MYSQL_IP=localhost \
-e FINAL_MYSQL_PORT=$4 \
java org.dbms.ServerApplication
# cmd to run server locally - java server.ServerApp localhost 1111
