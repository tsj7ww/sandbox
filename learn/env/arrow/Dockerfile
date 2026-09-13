FROM ubuntu:22.04
LABEL maintainer="Your Name <your.email@example.com>"

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libboost-all-dev \
    libssl-dev \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/apache/arrow.git \
    && cd arrow/cpp \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

CMD ["python3"]