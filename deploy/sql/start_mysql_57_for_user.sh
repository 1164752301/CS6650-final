
set -x
currdir=$(cd $(dirname $0); pwd);

docker_name="$1"

rm -rf /Volumes/final/self-test-mysql/data2;
mkdir -p /Volumes/final/self-test-mysql/data2;
chmod 777 /Volumes/final/self-test-mysql/data2;

if [ 1 -eq $(docker ps -a | grep ${docker_name} | wc -l) ];
then
  docker rm -f ${docker_name}
fi

docker run -p $2:3306 \
--name="${docker_name}" \
--platform="linux/amd64" \
--restart=always \
-e MYSQL_ROOT_PASSWORD=Y2h5d9pDa9D \
-v /Volumes/final/self-test-mysql/data2:/var/lib/mysql --user 1000 \
-v ${currdir}/init:/docker-entrypoint-initdb.d/ \
-v ${currdir}/post_init:/opt/sql \
-v mysqld.cnf:/etc/mysql/mysql.conf.d/ \
-d mysql:5.7\

docker ps|grep ${docker_name}
