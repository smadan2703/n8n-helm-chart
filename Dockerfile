ROM docker.n8n.io/n8nio/n8n:latest
USER root
RUN apk update && apk add --no-cache \
    docker-cli \
    aws-cli \
    python3 \
    py3-pip \
    docker-credential-ecr-login

RUN addgroup -g 988 docker && addgroup node docker
USER node
