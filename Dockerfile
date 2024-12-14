FROM ubuntu:24.04

RUN apt-get update && apt-get install -y git \
    autoconf \
    build-essential \
    make \
    gcc-11 \
    libtool \
    pkg-config \
    mesa-common-dev \
    vim \
    libpixman-1-dev \
    libdrm-dev \
    libx11-dev \
    libegl1-mesa-dev \
    libgcrypt20-dev \
    libxkbfile-dev \
    libsixel-dev \
    libfreetype-dev \
    libfontenc-dev \
    xutils-dev \
    xfonts-base \
    xtrans-dev \
    xkb-data \
    x11-xkb-utils 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 0

RUN git clone https://gitlab.freedesktop.org/xorg/lib/libxfont.git --depth 1 --branch libXfont-1.5.4 && \
    cd libxfont && \
    ./autogen.sh && \
    make && \
    make install && \
    ldconfig

RUN git clone https://github.com/saitoha/xserver-SIXEL.git --depth 1 && \
    cd xserver-SIXEL && \
    ./build-xsixel.sh && \
    make install

ENV DISPLAY=":0"
ENV SCREEN="1920x1080"

CMD ["sh", "-c", "Xsixel ${DISPLAY} -screen ${SCREEN} 2>/dev/null"]
