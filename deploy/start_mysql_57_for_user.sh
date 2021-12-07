# 启动一个自测调试用数据库
set -x
# 目录
currdir=$(cd $(dirname $0); pwd);

docker_name="$1"

rm -rf /Volumes/final/self-test-mysql/data;
mkdir -p /Volumes/final/self-test-mysql/data;
chmod 777 /Volumes/final/self-test-mysql/data;

if [ 1 -eq $(docker ps -a | grep ${docker_name} | wc -l) ];
then
  docker rm -f ${docker_name}
fi

## 默认L1测试mysql端口35005
docker run -p $2:3306 \
--name="${docker_name}" \
--platform="linux/amd64" \
--restart=always \
-e MYSQL_ROOT_PASSWORD=${MES_MYSQL_PASSWORD:-Y2h5d9pDa9D} \
-v /Volumes/final/self-test-mysql/data:/var/lib/mysql --user 1000 \
-v ${currdir}/init:/docker-entrypoint-initdb.d/ \
-v ${currdir}/post_init:/opt/sql \
-v ${currdir}/upgrade:/opt/sql/upgrade \
-v ${currdir}/rollback:/opt/sql/rollback \
-v mysqld.cnf:/etc/mysql/mysql.conf.d/ \
-d mysql:5.7\

docker ps|grep ${docker_name}
