#!/bin/bash

source .env

NS=external-secret

TEMPLATE_FILE=external-secret/cluster-secret-store.yaml
cp ${TEMPLATE_FILE} ${TEMPLATE_FILE}.tmp
sed -i "s#<<PROJECT>>#${PROJECT}#g" ${TEMPLATE_FILE}.tmp
sed -i "s#<<NS>>#${NS}#g" ${TEMPLATE_FILE}.tmp
kubectl apply -n ${NS} -f ${TEMPLATE_FILE}.tmp
