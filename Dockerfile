FROM node:8-alpine

RUN apk --update upgrade && \
    apk add --update inotify-tools && \
    rm -rf /var/cache/apk/*

RUN npm install -g apidoc

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apidoc"]
