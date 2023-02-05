## Build vanilla-first-setup
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    build-essential meson libadwaita-1-dev \
    gettext desktop-file-utils git

RUN git clone https://github.com/Vanilla-OS/first-setup.git
WORKDIR first-setup
RUN meson build --prefix /usr && ninja -C build
RUN DESTDIR=/opt ninja -C build install
RUN tar cfz vanilla-first-setup.tar.gz /opt