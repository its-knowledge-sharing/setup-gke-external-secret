#!/bin/bash

source .env

gcloud container clusters create ${CLUSTER_NAME} --zone us-central1-a --project ${PROJECT}

gcloud container clusters get-credentials ${CLUSTER_NAME} --zone us-central1-a --project ${PROJECT}

kubectl get nodes
