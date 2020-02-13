#!/bin/bash 
istioctl=/istioctl/istioctl
gcloud=/gcloud/google-cloud-sdk/bin/gcloud

CONFIG_DIR=$1
REPO_TOKEN=$2
GCP_CREDS=$3
PROJECT_NAME=$4
CLUSTER_NAME=$5
ZONE=$6

echo "$GCP_CREDS" > credentials.json

set -euxo pipefail

$gcloud auth activate-service-account --key-file credentials.json
$gcloud container clusters get-credentials $CLUSTER_NAME \
	--project $PROJECT_NAME \
	--zone $ZONE

$istioctl analyze -R $CONFIG_DIR --use-kube=true -A
