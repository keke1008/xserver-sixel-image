FROM ubuntu:24.04 AS build-env

RUN apt-get update && apt-get install -y \
    git \
    autoconf \
    build-essential \
    make \
    gcc-11 \
    libtool \
    pkg-config \
    mesa-common-dev \
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

FROM ubuntu:24.04

COPY --from=build-env /usr/local/bin/Xsixel /usr/local/bin/Xsixel
COPY --from=build-env /usr/local/lib/libXfont.* /usr/local/lib/

RUN apt-get update && apt-get install -y \
    libpixman-1-0 \
    libxau6 \
    libsixel1 \
    libfreetype6 \
    libfontenc1  \
    xkb-data \
    x11-xkb-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV DISPLAY=":0" SCREEN="1920x1080"
CMD ["sh", "-c", "Xsixel ${DISPLAY} -screen ${SCREEN} 2>/dev/null"]
