#!/bin/sh

set -e

ibmcloud login -u "$USERNAME" -p "$PASSWORD" -r "$CF_REGION"
ibmcloud target --cf
ibmcloud plugin install -f cloud-functions
ibmcloud fn action update "$APP_NAME" --docker "$CF_DOCKER_IMAGE" "$MAIN_SCRIPT_NAME"

