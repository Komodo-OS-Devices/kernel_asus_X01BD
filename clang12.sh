#!/usr/bin/env bash
export KBUILD_BUILD_USER="Wahyu"
export KBUILD_BUILD_HOST="Aegis-Build"
export ARCH=arm64

make O=out ARCH=arm64 aegis_defconfig

PATH="/home/wahyu/project/proton/bin:/home/wahyu/project/gcc/bin:${PATH}" \
                            LD_LIBRARY_PATH="/home/wahyu/project/proton/lib:${LD_LIBRARY_PATH}" \
                            make -j$(nproc --all) O=out \
                            CC=clang-12 \
                            CROSS_COMPILE=aarch64-linux-android- \
                            CROSS_COMPILE_ARM32=arm-linux-androideabi- \
                            AR=llvm-ar \
                            AS=llvm-as \
                            NM=llvm-nm \
                            OBJCOPY=llvm-objcopy \
                            OBJDUMP=llvm-objdump \
                            OBJSIZE=llvm-size \
                            READELF=llvm-readelf \
                            STRIP=llvm-strip \
                            HOSTCC=clang \
                            HOSTCXX=clang++ \
                            HOSTAR=llvm-ar \
                            CLANG_TRIPLE=aarch64-linux-gnu- \
                            2>&1 | tee log.jancok
