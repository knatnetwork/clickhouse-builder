FROM ubuntu:20.04 

ARG DEBIAN_FRONTEND=noninteractive

ENV CC=clang-12
ENV CXX=clang++-12

WORKDIR /tmp/
RUN apt update && apt install git python ninja-build wget lsb-release software-properties-common make libssl-dev tcc libc-dev -y
RUN wget -q https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 12 && rm -f llvm.sh
RUN wget -q https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3.tar.gz \
    && tar xf cmake-3.21.3.tar.gz && cd cmake-3.21.3 && ./configure && make -j 8 && make install && cd /tmp/ && rm -rf *
