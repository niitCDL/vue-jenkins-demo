#!/bin/bash
version=$1
imagename=nginx-agent
container=nginx-agent
echo "执行docker ps"
docker ps 
if [[ "$(docker inspect $container 2> /dev/null | grep $container)" != "" ]]; 
then 
  echo $container "容器存在，停止并删除"
  echo "docker stop" $container
  docker stop $container
  echo "docker rm" $container
  docker rm $container
else 
  echo $container "容器不存在"
fi
# 删除镜像
echo "执行docker images"
docker imagesps 
if [[ "$(docker images -q $imagesname 2> /dev/null)" != "" ]]; 
then 
  echo $imagesname '镜像存在，删除它'
  docker rmi $(docker images -q $imagesname 2> /dev/null)
else 
  echo $imagesname '不存在'
fi
docker build -t nginx-agent:$version .
echo "执行docker images"
docker images 
docker run --name nginx-agent -p 8001:80 -d $imagename:$version
