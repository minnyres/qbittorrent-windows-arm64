# qbittorrent-windows-arm64
[qBittorrent](https://github.com/qbittorrent/qBittorrent) is a bittorrent client programmed in C++ / Qt that uses libtorrent. The goal of this repository is to build qBittorrent for Windows on ARM64 (WoA).

Please go to [releases](https://github.com/minnyres/qbittorrent-windows-arm64/releases) for the latest binary files.

## How to build

### Cross compile on Windows x64

This is the way we release qBittorrent for Windows on ARM64. A [workflow file](https://github.com/minnyres/qbittorrent-windows-arm64/blob/main/.github/workflows/ci_windows_arm64.yaml) is written to automatically build with Github actions.

### Native compile on Windows 11 ARM64

It is not difficult to build with MSYS2.

1. Install [MSYS2-64bit](https://www.msys2.org/).
2. Enable and open the Clang ARM64 environment in MSYS2, following https://github.com/msys2/MSYS2-packages/issues/1787#issuecomment-980837586.
3. Run the build script `./build.sh`
