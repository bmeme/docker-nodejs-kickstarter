FROM node:16.18-bullseye-slim

RUN set -eux; \
    apt-get update -y && apt-get install -y git less libcap2-bin ; \
    setcap cap_net_bind_service=+ep `readlink -f \`which node\``; \
    rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*; 

ARG DOCKER_USER
ARG DOCKER_GROUP
ARG FIX_UID
ARG FIX_GID

ADD fix-perm.sh /fix-perm.sh
RUN chmod +x /fix-perm.sh && /fix-perm.sh
