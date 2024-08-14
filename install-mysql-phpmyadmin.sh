# software version
MYSQL_IMAGE=mysql:8.4.0
PHPMYADMIN_IMAGE=phpmyadmin:latest

# mysql config
MYSQL_NAME=demo-mysql
MYSQL_ROOT_USERNAME=root
MYSQL_ROOT_PASSWORD=root
MYSQL_MAPPING_PORT=33062

# phpmyadmin config
PHPMYADMIN_NAME=demo-phpmyadmin
PHPMYADMIN_MAPPING_PORT=33067

# demo-resume-network is the network for all the demo projects
if !(docker network ls | grep "demo-resume-network" &> /dev/null); then
    docker network create demo-resume-network
fi

docker run -d -p ${MYSQL_MAPPING_PORT}:3306 --name ${MYSQL_NAME} -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} --net demo-resume-network -v demo-dbdir:/var/lib/mysql ${MYSQL_IMAGE} && \
docker run -d -p ${PHPMYADMIN_MAPPING_PORT}:80 --name ${PHPMYADMIN_NAME} -e PMA_HOST=${MYSQL_NAME} -e PMA_PORT=3306 -e PMA_USER=${MYSQL_ROOT_USERNAME} -e PMA_PASSWORD=${MYSQL_ROOT_PASSWORD} --net demo-resume-network ${PHPMYADMIN_IMAGE}