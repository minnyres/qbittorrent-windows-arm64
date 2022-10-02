#!/bin/bash

set -e
runtime=clang-aarch64

workdir=$PWD

pacman -S --needed diffutils p7zip mingw-w64-${runtime}-boost mingw-w64-${runtime}-clang mingw-w64-${runtime}-cmake mingw-w64-${runtime}-qt5-base mingw-w64-${runtime}-qt5-svg mingw-w64-${runtime}-qt5-tools mingw-w64-${runtime}-qt5-translations mingw-w64-${runtime}-qt5-winextras

# Build libtorrent
wget -nc https://github.com/arvidn/libtorrent/releases/download/v1.2.17/libtorrent-rasterbar-1.2.17.tar.gz
tar -xf libtorrent-rasterbar-1.2.17.tar.gz
cd libtorrent-rasterbar-1.2.17
mkdir build 
cd build 
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=17 -DCMAKE_INSTALL_PREFIX="C:/libtorrent" ..
cmake --build . 
cmake --install .

# Build qbittorrent
cd $workdir
wget -nc http://prdownloads.sourceforge.net/qbittorrent/qbittorrent/qbittorrent-4.4.5/qbittorrent-4.4.5.tar.xz
tar -xf qbittorrent-4.4.5.tar.xz
cd qbittorrent-4.4.5
mkdir build 
cd build 
export PKG_CONFIG_PATH="/c/libtorrent/lib/pkgconfig"
export LDFLAGS="-lws2_32"
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_MODULE_PATH="C:/libtorrent/share/cmake/Modules" -DCMAKE_INSTALL_PREFIX="C:/qbittorrent" -DSTACKTRACE=OFF ..
cmake --build . 
cmake --install .

# Package and clean
cd $workdir
cp -r /c/qbittorrent .
cd qbittorrent
mv bin/* .
rmdir bin
windeployqt qbittorrent.exe
cp /clangarm64/bin/zlib1.dll .
cp /clangarm64/bin/libpng16-16.dll .
cp /clangarm64/bin/libmd4c.dll .
cp /clangarm64/bin/libc++.dll .
cp /clangarm64/bin/libharfbuzz-0.dll .
cp /clangarm64/bin/libcrypto-1_1.dll .
cp /clangarm64/bin/libicuin71.dll .
cp /clangarm64/bin/libdouble-conversion.dll .
cp /clangarm64/bin/libpcre2-16-0.dll .
cp /clangarm64/bin/libzstd.dll .
cp /clangarm64/bin/libicuuc71.dll .
cp /clangarm64/bin/libunwind.dll .
cp /clangarm64/bin/libgraphite2.dll .
cp /clangarm64/bin/libfreetype-6.dll .
cp /clangarm64/bin/libglib-2.0-0.dll .
cp /clangarm64/bin/libintl-8.dll .
cp /clangarm64/bin/libssl-1_1.dll .
cp /clangarm64/bin/libiconv-2.dll .
cp /clangarm64/bin/libicudt71.dll .
cp /clangarm64/bin/libpcre2-8-0.dll .
cp /clangarm64/bin/libbrotlidec.dll .
cp /clangarm64/bin/libbz2-1.dll .
cp /clangarm64/bin/libbrotlicommon.dll .
cp /c/libtorrent/bin/libtorrent-rasterbar.dll .
cd ..
7z a -mx9 qBittorrent-4.4.5.1-Qt5-WinARM64.7z qbittorrent