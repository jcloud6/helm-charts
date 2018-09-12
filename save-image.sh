#!/usr/bin/env bash

set -e
set -x

export REGISTRY=10.11.0.6:5000

docker save ${REGISTRY}/dubbo:zookeeper | gzip -c > dubbo-zookeeper.tgz
docker save ${REGISTRY}/dubbo:producer | gzip -c > dubbo-producer.tgz
docker save ${REGISTRY}/dubbo:consumer | gzip -c > dubbo-consumer.tgz
docker save  ${REGISTRY}/nginx | gzip -c >  nginx.tgz
