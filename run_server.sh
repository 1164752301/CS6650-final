SERVER_IMAGE='final-server-image'
PROJECT_NETWORK='final-network'

if [ $# -ne 4 ]
then
  echo "Usage: ./run_server.sh <container-name> <db-IP> <db-PORT> <backend-port>"
  exit
fi

# run client docker container with cmd args
docker run -it --rm --name $1 \
--network $PROJECT_NETWORK $SERVER_IMAGE \
-p $4:30001 \
-e FINAL_MYSQL_PASSWORD=Y2h5d9pDa9D \
-e FINAL_MYSQL_IP=$2 \
-e FINAL_MYSQL_PORT=$3 \
java org.dbms.ServerApplication
# cmd to run server locally - java server.ServerApp localhost 1111
