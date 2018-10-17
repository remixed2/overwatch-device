FROM resin/raspberry-pi-alpine-node:0.10.22-slim

RUN apk add --update --no-cache \
    python \
    py-pip \
    v4l-utils \
    alsa-utils \
    && pip install b2 \
    && mkdir /test && cd /test \
    && wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-armhf-32bit-static.tar.xz \
    && unxz ffmpeg-release-armhf-32bit-static.tar.xz \
    && tar -xf ffmpeg-release-armhf-32bit-static.tar

COPY upload-files.sh /upload-files.sh

CMD ./upload-files.sh