#!/bin/sh
DOCKERHUB_ACCOUNT="drlee001"
docker login -u ${DOCKERHUB_ACCOUNT}
docker build -t ${DOCKERHUB_ACCOUNT}/test-webapp-1:latest -f applications/test-webapp-1/Dockerfile applications/test-webapp-1/
docker push ${DOCKERHUB_ACCOUNT}/test-webapp-1:latest
