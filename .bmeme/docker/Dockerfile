FROM node:16.13-bullseye-slim

ARG DOCKER_USER
ARG DOCKER_GROUP
ARG FIX_UID
ARG FIX_GID

ADD fix-perm.sh /fix-perm.sh
RUN chmod +x /fix-perm.sh && /fix-perm.sh
