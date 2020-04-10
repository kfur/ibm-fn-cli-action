#!/bin/sh

set -e

ibmcloud cf login -a "$CF_API_ENDPOINT" -o "$ORG" -s "$SPACE" -u "$USERNAME" -p "$PASSWORD"

ibmcloud fn action update "$APP_NAME" --docker "$CF_DOCKER_IMAGE" "$MAIN_SCRIPT_NAME"

