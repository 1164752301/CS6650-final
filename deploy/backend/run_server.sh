SERVER_IMAGE='project4-server-image'
PROJECT_NETWORK='project4-network'


echo "Usage: ./run_server.sh <container-name> -pal <host:port> -p <host:port> -a <host:port> -l <host:port>"

# run client docker container with cmd args
a=$1
shift 1
docker run -it --rm --name $a\
 --network $PROJECT_NETWORK $SERVER_IMAGE \
 java server.ServerApp "$@"
 # cmd to run server locally - java server.ServerApp localhost 1111
