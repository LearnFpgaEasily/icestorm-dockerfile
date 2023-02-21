FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update; apt-get -y install curl git

RUN apt-get install -y build-essential clang bison flex gperf libfl2 \
    libfl-dev libreadline-dev gawk tcl-dev libffi-dev \
    graphviz xdot pkg-config python python3 libftdi-dev \
    qt5-default python3-dev libboost-all-dev cmake libeigen3-dev

RUN git clone https://github.com/YosysHQ/icestorm.git icestorm

RUN cd icestorm; make -j$(nproc); make install
