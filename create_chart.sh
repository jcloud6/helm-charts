#!/usr/bin/env bash

set -e
set -x

export ONE_BOX=10.0.160.9
export AUTH_TOKEN=97898f42b8c95098df3f82037f43bf13fa33ff53
export REGION=dev
export SPACE_NAME=global
export REGISTRY=10.0.160.9:5000
export ALB_NAME=nginx-10-0-160-9
export ALB_IP=10.0.160.9
export GIT_HOST=10.0.160.9:9988
export GIT_USER=root
export GIT_PASS=alauda1234

mkdir -p chart
cp -rf stable/* chart/
cd chart

grep -rl '{{REGISTRY}}' . | xargs sed -i '' "s/{{REGISTRY}}/${REGISTRY}/g"
grep -rl '{{ALB_NAME}}' . | xargs sed -i '' "s/{{ALB_NAME}}/${ALB_NAME}/g"
grep -rl '{{ALB_IP}}' .   | xargs sed -i '' "s/{{ALB_IP}}/${ALB_IP}/g"
grep -rl '{{GIT_HOST}}' . | xargs sed -i '' "s/{{GIT_HOST}}/${GIT_HOST}/g"
grep -rl '{{GIT_USER}}' . | xargs sed -i '' "s/{{GIT_USER}}/${GIT_USER}/g"
grep -rl '{{GIT_PASS}}' . | xargs sed -i '' "s/{{GIT_PASS}}/${GIT_PASS}/g"
