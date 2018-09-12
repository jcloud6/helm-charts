#!/usr/bin/env bash

set -e
set -x

#export REGISTRY=10.11.0.6:5000

docker pull nginx
docker save nginx | gzip -c >  nginx.tgz
#docker tag nginx ${REGISTRY}/nginx
#docker push ${REGISTRY}/nginx
docker rmi nginx

docker save dubbo:admin | gzip -c > dubbo-admin.tgz
docker rmi dubbo:admin

docker pull registry.aliyuncs.com/acs-sample/zookeeper:3.4.8
docker tag registry.aliyuncs.com/acs-sample/zookeeper:3.4.8 dubbo:zookeeper
docker rmi registry.aliyuncs.com/acs-sample/zookeeper:3.4.8
docker save dubbo:zookeeper | gzip -c > dubbo-zookeeper.tgz
docker rmi dubbo:zookeeper

docker pull registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-producer:latest
docker tag registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-producer:latest dubbo:producer
docker rmi registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-producer:latest
docker save dubbo:producer | gzip -c > dubbo-producer.tgz
docker rmi dubbo:producer

docker pull registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-consumer:latest
docker tag registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-consumer:latest dubbo:consumer
docker rmi registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-consumer:latest
docker save dubbo:consumer | gzip -c > dubbo-consumer.tgz
docker rmi dubbo:consumer

