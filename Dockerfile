FROM alpine:3.8

LABEL "name"="Cloud Foundry CLI Action"
LABEL "maintainer"="ltlamontagne@gmail.com>"
LABEL "version"="1.0.1"

LABEL "com.github.actions.name"="GitHub Action for Cloud Foundry"
LABEL "com.github.actions.description"="Wraps the Cloud foundry CLI to enable CF commands."
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="green"

# Install uuidgen
RUN apk add --no-cache ca-certificates curl bash jq util-linux
RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
RUN ibmcloud plugin install cloud-functions

# Install Cloud Foundry cli
RUN ibmcloud cf install

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
