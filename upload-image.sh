#!/usr/bin/env bash

set -e
set -x

export REGISTRY=10.11.0.6:5000

docker pull nginx
docker tag nginx ${REGISTRY}/nginx
docker push ${REGISTRY}/nginx

docker pull registry.aliyuncs.com/acs-sample/zookeeper:3.4.8
docker tag registry.aliyuncs.com/acs-sample/zookeeper:3.4.8 ${REGISTRY}/dubbo:zookeeper
docker push ${REGISTRY}/dubbo:zookeeper

docker pull registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-producer:latest
docker tag registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-producer:latest ${REGISTRY}/dubbo:producer
docker push ${REGISTRY}/dubbo:producer

docker pull registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-consumer:latest
docker tag registry.cn-hangzhou.aliyuncs.com/jingshanlb/dubbo-springboot-consumer:latest ${REGISTRY}/dubbo:consumer
docker push ${REGISTRY}/dubbo:consumer
