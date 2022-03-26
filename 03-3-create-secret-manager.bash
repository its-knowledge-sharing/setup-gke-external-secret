#!/bin/bash

source .env

SECRET_NAME=gcp-demo-secret-key
TEST_CREDENTIAL1=$(openssl rand -hex 8)
TEST_CREDENTIAL2=$(openssl rand -hex 8)

gcloud secrets --project ${PROJECT} create ${SECRET_NAME} --replication-policy="automatic"

cat << EOF | gcloud secrets --project ${PROJECT} versions add ${SECRET_NAME} --data-file=-
{
    "TEST_CREDENTIAL1": "${TEST_CREDENTIAL1}",
    "TEST_CREDENTIAL2": "${TEST_CREDENTIAL2}"
}
EOF
