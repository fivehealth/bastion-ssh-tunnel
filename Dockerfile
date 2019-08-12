FROM alpine:latest
MAINTAINER Yanchuan Sim <yanchuan@outlook.com>

RUN apk --no-cache add openssh-client

ENV BASTION_HOST=
ENV REMOTE_HOST=
ENV REMOTE_PORT=
ENV LOCAL_PORT=8000

VOLUME /private.key

ENTRYPOINT ["sh", "-c", "/usr/bin/ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=9999999 -C -X -N -T -L localhost:${LOCAL_PORT}:${REMOTE_HOST}:${REMOTE_PORT} -i private.key ${BASTION_HOST}"]
