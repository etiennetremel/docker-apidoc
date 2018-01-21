FROM node:8-alpine

ENV APIDOC_VERSION=0.17.5

RUN apk add --update inotify-tools \
    && npm install -g apidoc@${APIDOC_VERSION} \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apidoc"]
