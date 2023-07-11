FROM debian:trixie
MAINTAINER Leonid Kolesnichenko <xperience439@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    g++ \
    git-core \
    libboost-dev \
    libexpat1-dev \
    zlib1g-dev \
    libbz2-dev \
    pandoc \
    libboost-filesystem-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libbz2-dev \
    libgeos++-dev \
    libgeos-dev \
    liblua5.3-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-c-dev \
    libtool \
    libxml2-dev \
    lua5.3 \
    make \
    cmake \
    protobuf-c-compiler &&\
    rm -rf /var/lib/apt/lists/*

ENV HOME /root
ENV OSM2PGSQL_VERSION 1.8.1

RUN mkdir src && \
    cd src && \
    git clone --depth 1 --branch $OSM2PGSQL_VERSION https://github.com/openstreetmap/osm2pgsql.git && \
    cd osm2pgsql && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install
    

ENTRYPOINT ["/bin/bash"]
