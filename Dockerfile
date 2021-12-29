FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install --no-install-recommends build-essential asciidoc binutils \
    bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 \
    unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core \
    gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto \
    qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler \
    g++-multilib antlr3 gperf wget curl swig rsync sudo screen vim gosu && \
    apt-get clean all

RUN useradd -m openwrt -s /bin/bash && \
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt && \
    echo 'shell "/bin/bash"' >> /etc/screenrc

WORKDIR /home/openwrt
