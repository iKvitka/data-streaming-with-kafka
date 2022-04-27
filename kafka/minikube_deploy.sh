#!/usr/bin/env bash

kubectl config use-context minikube

kubectl create namespace kafka 2> /dev/null || :
kubectl config set-context minikube --namespace=kafka

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm upgrade --wait --install --timeout=17m --namespace=kafka kafka bitnami/kafka --version 14.9.0 \
--values=values.yaml
