#!/bin/sh
mkdir build || true
kubectl port-forward --namespace default svc/kibana 5601:5601 > build/kibana.log 2>&1 &
curl http://localhost:5601

while [ $? -ne 0 ]; do
    kubectl port-forward --namespace default svc/kibana 5601:5601 > build/kibana.log 2>&1 &
    curl http://localhost:5601
    sleep 5
done
