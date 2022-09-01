FROM ubuntu:22.04
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get -y update && DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y python3 python3-pip aria2 qbittorrent-nox \
    tzdata p7zip-full p7zip-rar xz-utils curl pv jq ffmpeg \
    locales git unzip rtmpdump libmagic-dev libcurl4-openssl-dev \
    libssl-dev libc-ares-dev libsodium-dev libcrypto++-dev \
    libsqlite3-dev libfreeimage-dev libpq-dev libffi-dev \
    && locale-gen en_US.UTF-8 && \
    curl -L https://github.com/ytubeupX/cautious-octo-potato/releases/download/v0.1.3/megasdkrest-amd64\
    -o /usr/local/bin/megasdkrest && chmod +x /usr/local/bin/megasdkrest

COPY ./req/requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
