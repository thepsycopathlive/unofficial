#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper

echo
echo "Issue Build Commands"
echo

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/media/miles/Storage/CLANG_TC/tc-build/install/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=~/Android_Build/GCC_Google_Arm64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

echo
echo "Set DEFCONFIG"
echo 
make CC=clang O=out kirisakura_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang O=out -j4
