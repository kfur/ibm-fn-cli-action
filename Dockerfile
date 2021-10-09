FROM alpine:3.8

LABEL "name"="IBM Functions Update Action"
LABEL "maintainer"="noone@gmail.com>"
LABEL "version"="1.0.1"

LABEL "com.github.actions.name"="GitHub Action for IBM Functions Update"
LABEL "com.github.actions.description"="Wraps the IBM Functions CLI to enable for updating purpose."
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="green"

# Install uuidgen
RUN apk add --no-cache ca-certificates curl bash jq util-linux
RUN curl -kfsSL https://clis.cloud.ibm.com/install/linux | sh
RUN ibmcloud plugin install cloud-functions

# Install Cloud Foundry cli
RUN ibmcloud cf install

COPY README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
