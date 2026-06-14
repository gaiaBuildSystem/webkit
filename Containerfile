FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://deb.debian.org/debian bookworm main' > /etc/apt/sources.list && \
    echo 'deb http://deb.debian.org/debian-security bookworm-security main' >> /etc/apt/sources.list && \
    echo 'deb http://deb.debian.org/debian bookworm-updates main' >> /etc/apt/sources.list

RUN apt-get -q -y update && \
    apt-get -q -y install \
    bubblewrap \
    xdg-dbus-proxy \
    cmake \
    gperf \
    libcairo2-dev \
    libgbm-dev \
    libgcrypt20-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer1.0-dev \
    libharfbuzz-dev \
    libjpeg-dev \
    liblcms2-dev \
    libsoup-3.0-dev \
    libsqlite3-dev \
    libsystemd-dev \
    libtasn1-6-dev \
    libwayland-dev \
    libwebp-dev \
    ninja-build \
    ruby \
    gobject-introspection \
    libgirepository1.0-dev \
    blhc \
    dh-make \
    dput-ng \
    build-essential \
    devscripts \
    quilt \
    lintian \
    devscripts \
    diffutils \
    patch \
    patchutils \
    quilt \
    git \
    dgit \
    build-essential \
    libseccomp-dev \
    jdupes \
    libatk-bridge2.0-dev \
    libepoxy-dev \
    libopenjp2-7-dev \
    libwoff-dev \
    libwpe-1.0-dev \
    libwpebackend-fdo-1.0-dev \
    libxslt1-dev \
    wayland-protocols \
    gi-docgen \
    libglib2.0-doc \
    libsoup-3.0-doc

WORKDIR /webkit

CMD [ "dpkg-buildpackage", "-b", "-us", "-uc", "--hook-done=mv ../*.deb ../*.buildinfo ../*.changes /webkit/" ]
