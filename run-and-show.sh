#!/bin/sh
kubectl apply -f applications/test-webapp-1/k8s/deployment.yaml
kubectl get svc test-webapp-1
