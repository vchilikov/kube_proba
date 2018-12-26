#!/usr/bin/env bash

docker build -t vchilikov/kube_proba .
docker push vchilikov/kube_proba

kubectl delete deployment -l app=redis
kubectl delete service -l app=redis
kubectl apply -f k8s/redis-deployment.yaml
kubectl apply -f k8s/redis-service.yaml

kubectl delete deployment -l app=kube-proba
kubectl delete service -l app=kube-proba
kubectl apply -f k8s/kube-proba-deployment.yaml
kubectl apply -f k8s/kube-proba-services.yaml

kubectl delete cronjobs.batch set-time
kubectl apply -f k8s/set-time.yaml

minikube service kube-proba --url