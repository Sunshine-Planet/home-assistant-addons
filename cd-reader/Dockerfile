ARG BUILD_FROM=ghcr.io/hassio-addons/base:12.2.7
FROM $BUILD_FROM
# Setup base
ARG BUILD_ARCH=amd64

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add env
ENV TERM="xterm-256color"

COPY rootfs/etc/apk /etc/apk



RUN  set -x \
  \
  && apk update \
    apk add --no-cache --virtual .build-dependencies \
        bsd-compat-headers=0.7.2-r3 \
        build-base=0.5-r2 \
        cmake=3.23.1-r0 \
        docker=20.10.16-r0 \
        json-c-dev=0.16-r0 \
        libffi-dev=3.4.2-r1 \
        libuv-dev=1.44.1-r0 \
        libxml2-dev \
        openssl-dev=1.1.1o-r0 \
        python3-dev=3.10.4-r0 \
        zlib-dev=1.2.12-r1 \
    \
    && apk add --no-cache \
        ack=3.5.0-r1 \
        alsa-plugins-pulse=1.2.6-r1 \
        alsa-utils=1.2.6-r0 \
        awake=1.0-r7 \
        bash-completion=2.11-r4 \
        bind-tools=9.16.29-r0 \
        bluez=5.64-r0 \
        colordiff=1.0.20-r0 \
        device-mapper-libs=2.02.187-r2 \
        git=2.36.1-r0 \
        htop=3.2.0-r1 \
        json-c=0.16-r0 \
        libltdl=2.4.7-r0 \
        libuv=1.44.1-r0 \
        libxml2-utils=2.9.14-r0 \
        mosh=1.3.2-r22 \
        mosquitto-clients=2.0.14-r0 \
        nano-syntax=6.3-r0 \
        nano=6.3-r0 \
        ncurses=6.3_p20220521-r0 \
        net-tools=2.10-r0 \
        networkmanager=1.38.0-r0 \
        nmap=7.92-r2 \
        openssh=9.0_p1-r1 \
        openssl=1.1.1o-r0 \
        pwgen=2.08-r1 \
        pulseaudio-utils=15.0-r2 \
        py3-pip=22.1.1-r0 \
        python3=3.10.4-r0 \
        rsync=3.2.4-r0 \
        sqlite=3.38.5-r0 \
        sudo=1.9.10-r0 \
        tmux=3.2a-r0 \
        vim=8.2.5000-r0 \
        wget=1.21.3-r0 \
        zip=3.0-r9 \
        zsh=5.8.1-r4 


RUN apk add libdvdcss \
      flac \
      lame \
  handbrake \
      abcde \
      cdparanoia \

RUN sed -i -e "s#bin/ash#bin/zsh#" /etc/passwd \
    \
    && git clone --branch "v4.3.2" --depth=1 \
        https://github.com/warmcat/libwebsockets.git /tmp/libwebsockets \
    \
    && mkdir -p /tmp/libwebsockets/build \
    && cd /tmp/libwebsockets/build \
    && cmake .. \
        -DCMAKE_BUILD_TYPE=MinSizeRel \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=TRUE \
        -DLWS_IPV6=ON \
        -DLWS_STATIC_PIC=ON \
        -DLWS_UNIX_SOCK=OFF \
        -DLWS_WITH_LIBUV=ON \
        -DLWS_WITH_SHARED=ON \
        -DLWS_WITHOUT_TESTAPPS=ON \
    && make \
    && make install \
    \
    && git clone --branch main --single-branch \
        https://github.com/tsl0922/ttyd.git /tmp/ttyd \
    && git -C /tmp/ttyd checkout "1.7.2" \
    \
    && mkdir -p /tmp/ttyd/build \
    && cd /tmp/ttyd/build \
    && cmake .. \
        -DCMAKE_BUILD_TYPE=MinSizeRel \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=TRUE \
    && make \
    && make install

RUN pip3 install -U \
    eyed3 \
    pylast==2.4.0 
  
RUN curl -SLo /tmp/libdiscid.tar.gz http://ftp.musicbrainz.org/pub/musicbrainz/libdiscid/libdiscid-0.6.2.tar.gz \
  && cd /tmp \
  && tar xvf libdiscid.tar.gz \
  && cd libdiscid-0.6.2 \
  && ./configure \
  && make \
  && make install 

RUN perl -MCPAN -e "CPAN::Shell->notest('install', 'IO::Socket::SSL', '>= 2.009')" \
  &&  perl -MCPAN -e "CPAN::Shell->notest('install', 'XML::LibXML')" \
  &&  perl -MCPAN -e "CPAN::Shell->notest('install', 'YAML')" \
  &&  perl -MCPAN -e "CPAN::Shell->notest('install', 'WebService::MusicBrainz')" \
  &&  perl -MCPAN -e "CPAN::Shell->notest('install', 'MusicBrainz::DiscID')" \
  &&  perl -MCPAN -e "CPAN::Shell->notest('install', 'MusicBrainz')" \
  && apk del deps

COPY rootfs /  

RUN \
    chmod 0750 /etc/sudo.conf \
    && chmod 0750 -R /etc/sudoers.d \
    && chmod 0640 /etc/sudoers.d

      
RUN  mkdir -p /media/music 

COPY abcde.conf /etc/abcde.conf

