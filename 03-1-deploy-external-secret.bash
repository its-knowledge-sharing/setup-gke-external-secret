#!/bin/bash

source .env

KEY_FILE=gcp-creds.json
SA=${SA_NAME}@${PROJECT}.iam.gserviceaccount.com
SECRET=gcp-secret-manager

NS=external-secret
kubectl create ns ${NS}

# Create service account secret
gcloud iam service-accounts keys create ${KEY_FILE} --iam-account=${SA}
kubectl delete secret ${SECRET} -n ${NS}
kubectl create secret generic ${SECRET} --from-file=${KEY_FILE}=${KEY_FILE} -n ${NS}

helm repo add external-secrets https://charts.external-secrets.io

helm template external-secrets external-secrets/external-secrets \
    -f external-secret/cluster-secret-store.yaml \
    --version 0.4.4 \
    --set installCRDs=true \
    --namespace ${NS} > tmp-external-secrets.yaml

kubectl apply -n ${NS} -f tmp-external-secrets.yaml
