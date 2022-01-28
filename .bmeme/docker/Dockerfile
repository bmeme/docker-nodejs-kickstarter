FROM node:16.13-bullseye-slim

ADD fix-perm.sh /fix-perm.sh
RUN chmod +x /fix-perm.sh

ENTRYPOINT [ "/fix-perm.sh" ]
