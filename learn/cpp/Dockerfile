# Use Ubuntu as the base image
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential packages and development tools
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gdb \
    clang \
    clangd \
    clang-format \
    clang-tidy \
    lldb \
    git \
    vim \
    curl \
    wget \
    pkg-config \
    zip \
    unzip \
    tar \
    ninja-build \
    valgrind \
    ccache \
    cppcheck \
    doxygen \
    graphviz \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Boost libraries
RUN apt-get update && apt-get install -y \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Google Test
RUN git clone https://github.com/google/googletest.git \
    && cd googletest \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install \
    && cd / \
    && rm -rf googletest

# Set up Conan package manager
RUN pip3 install conan

# Create a workspace directory
WORKDIR /workspace

# Create a simple test file to verify the environment
COPY <<EOF /workspace/test.cpp
#include <iostream>
#include <vector>
#include <boost/version.hpp>

int main() {
    std::cout << "C++ Development Environment Test\n";
    std::cout << "Boost version: " 
              << BOOST_VERSION / 100000 << "."
              << BOOST_VERSION / 100 % 1000 << "."
              << BOOST_VERSION % 100 << "\n";
    
    std::vector<int> v = {1, 2, 3, 4, 5};
    std::cout << "Vector size: " << v.size() << "\n";
    return 0;
}
EOF

# Create a CMake file for the test
COPY <<EOF /workspace/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(cpp_test)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

add_executable(test_app test.cpp)
target_link_libraries(test_app ${Boost_LIBRARIES})
EOF

# Build the test application to verify the environment
RUN cmake . && make

# Set default command
CMD ["/bin/bash"]