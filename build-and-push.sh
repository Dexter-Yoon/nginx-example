#!/bin/sh
DOCKERHUB_ACCOUNT="admin"
DOCKERURL="kubelb01:5000"
DOCKER_IMAGE="nginx-example"
sudo docker login -u ${DOCKERHUB_ACCOUNT} https://${DOCKERURL}/v1/
sudo docker build -t ${DOCKERURL}/${DOCKER_IMAGE}:latest -f applications/test-webapp-1/Dockerfile applications/test-webapp-1/
sudo docker push ${DOCKERURL}/${DOCKER_IMAGE}:latest
