#!/bin/sh

kubectl delete deploy kibana-deployment || true
kubectl delete service kibana || true
kubectl delete configmaps kibana-config || true
kubectl create -f ./config/helm/kibana/deployment.yaml

kubectl wait pods -l app=kibana --for condition=Ready

sh -x ./verify.sh

sh -x ./import.sh