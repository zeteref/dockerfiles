# original from:
# https://github.com/theshadowx/Qt5_Docker/blob/default_qt5_focal/Dockerfile

FROM ubuntu:20.04 AS build
MAINTAINER Ali Diouri <alidiouri@gmail.com>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update &&                  \
    apt install -y                 \
        git                        \
        wget                       \
        xvfb                       \
        flex                       \
        dh-make                    \
        debhelper                  \
        checkinstall               \
        fuse                       \
        bison                      \
        libxcursor-dev             \
        libxcomposite-dev          \
        software-properties-common \
        build-essential            \
        libssl-dev                 \
        libxcb1-dev                \
        libx11-dev                 \
        libgl1-mesa-dev            \
        libudev-dev                \
        qt5-default                \
        qtbase5-private-dev      &&\
    apt clean

WORKDIR /home/root/
