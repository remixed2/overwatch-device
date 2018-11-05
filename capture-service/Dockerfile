FROM resin/raspberrypi3-alpine:3.7

# Install apt deps
RUN apt-get update && apt-get install -y \
  apt-utils \
  build-essential \
  git \
  curl \
  psmisc \
  libraspberrypi0 \
  libpcre3 \
  python-smbus \
  i2c-tools \
  && rm -rf /var/lib/apt/lists/*

# Install x264
RUN cd /usr/src && \
  git clone git://git.videolan.org/x264 && \
  cd x264 && \
  ./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl && \
  make && \
  sudo make install

#Install ffmpeg
RUN cd /usr/src && \
  git clone git://source.ffmpeg.org/ffmpeg.git && \
  cd ffmpeg && \
  sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree && \
  make && \
  sudo make install

#COPY upload-files.sh /upload-files.sh

#CMD ./upload-files.sh