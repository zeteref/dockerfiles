FROM izilef/qtbuild AS build

ADD https://jztkft.dl.sourceforge.net/project/kdiff3/kdiff3/0.9.98/kdiff3-0.9.98.tar.gz /opt/build/
WORKDIR /opt/build
RUN tar xf kdiff3-0.9.98.tar.gz --strip 1
RUN ./configure qt4
WORKDIR /opt/build/releaseQt
RUN make install

FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update &&      \
    apt install -y     \
        qt5-default && \
    apt clean
COPY --from=build /usr/local/ /usr/local/

