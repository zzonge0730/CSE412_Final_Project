FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC \
    CC=gcc-7 \
    CXX=g++-7

# Base tools and dependencies for building LLVM 3.4/3.5 and Catamaran
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gcc-7 g++-7 \
        cmake \
        ninja-build \
        git \
        curl \
        ca-certificates \
        python3 \
        python3-pip \
        python-is-python3 \
        time \
        bash \
        xz-utils \
        unzip \
        pkg-config \
        libtinfo5 \
        libtinfo-dev \
        zlib1g-dev \
        libncurses5 \
        libncurses5-dev \
        libxml2-dev \
        libedit-dev \
        libboost-all-dev \
        libboost-graph-dev \
        libboost-filesystem-dev \
        libboost-program-options-dev \
    && rm -rf /var/lib/apt/lists/*

# Set gcc-7/g++-7 as defaults explicitly
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 70

WORKDIR /workspace

# Default shell
SHELL ["/bin/bash", "-lc"]

# Helpful environment for large parallel builds
ENV MAKEFLAGS=-j$(nproc)

# Print versions for debug
RUN gcc --version && g++ --version && cmake --version && python3 --version

# Third-party tools directories
ENV SOFTBOUNDCETS_DIR=/opt/softboundcets-34 \
    MOVEC_DIR=/opt/movec \
    LLVM352_DIR=/opt/llvm-3.5.2

# Create /opt for third-party tool installations
RUN mkdir -p /opt

# Note: Ubuntu 20.04 for LLVM compatibility (gcc-7)
# MoveC transformation should be done on host (requires GLIBC 2.35)
# Then compile the instrumented code inside this container

CMD ["bash"]
