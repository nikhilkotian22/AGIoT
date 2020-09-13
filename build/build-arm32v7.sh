#!/bin/bash

set -e

export ARM_ROOT=/usr/local/tools/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf

rm CMakeCache.txt cmake_install.cmake install_manifest.txt Makefile || :
rm -rf CMakeFiles/ || :
rm -rf src/ || :

cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug -DPLATFORM_NAME:STRING="arm32v7" -DEXTRA_CXX_FLAGS:STRING="--sysroot=$ARM_ROOT" -DCMAKE_TOOLCHAIN_FILE=./toolchain-arm32v7.cmake ..

make -j `nproc`
make install 

