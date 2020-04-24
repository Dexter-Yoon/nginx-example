#!/bin/sh
DOCKERHUB_ACCOUNT="admin"
DOCKERURL="kubelb01:5000"
DOCKER_IMAGE="nginx-example"
docker login -u ${DOCKERHUB_ACCOUNT} https://${DOCKERURL}/v1/
docker build -t ${DOCKERURL}/${DOCKER_IMAGE}:latest -f applications/test-webapp-1/Dockerfile applications/test-webapp-1/
docker push ${DOCKERURL}/${DOCKER_IMAGE}:latest
