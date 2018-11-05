#FROM resin/raspberry-pi-alpine-node:0.10.22-slim
FROM resin/raspberrypi3-alpine:3.7

RUN apk add --update --no-cache \
    python \
    py-pip \
    && pip install b2

COPY upload-files.sh /upload-files.sh

CMD ./upload-files.sh