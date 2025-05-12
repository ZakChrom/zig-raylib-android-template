#!/bin/bash
set -xe
if [ ! -d raylib ]; then
    git clone https://github.com/raysan5/raylib/ --depth=1
fi
cd raylib/src
make PLATFORM=PLATFORM_ANDROID ANDROID_ARCH=arm64 ANDROID_API_VERSION=29 ANDROID_NDK=../../android/ndk/ \
    RAYLIB_LIBTYPE=SHARED BUILD_MODE=release \
    RAYLIB_CONFIG_FLAGS=-isysroot=../../android/ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/
cp libraylib.5.5.0.so libraylib.so
cd ../..
