FROM resin/raspberry-pi-alpine-node:0.10.22-slim

RUN apk add --update --no-cache \
    python \
    py-pip \
    && pip install b2

COPY upload-files.sh /upload-files.sh

CMD ./upload-files.sh