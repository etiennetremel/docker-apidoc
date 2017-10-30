FROM node:8-alpine

RUN apk add --update inotify-tools \
    && npm install -g apidoc \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apidoc"]
