#!/bin/sh

export PATH=$HOME/android-toolchain/bin:$PATH
export SYSROOT=$HOME/android-toolchain/sysroot
export CC="arm-linux-androideabi-gcc --sysroot $SYSROOT"
export CFLAGS="$CFLAGS -static "


./autogen.sh 

wget http://curl.haxx.se/download/curl-${CURL_VER}.tar.gz
tar xfz curl-${CURL_VER}.tar.gz
cd curl-${CURL_VER}
./configure --host=arm-linux-androideabi --prefix=/home/jordan/android-toolchain/sysroot/usr/ --enable-static  --without-zlib
make
make install

cd ..

./configure --host=arm-linux-androideabi --prefix=/home/jordan/android-toolchain/sysroot/usr/ --enable-cpumining --enable-scrypt --disable-opencl --disable-adl --without-curses --enable-static --without-libudev
make 
make install
