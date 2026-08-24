# qbittorrent-windows-arm64
[qBittorrent](https://github.com/qbittorrent/qBittorrent) is a bittorrent client programmed in C++ / Qt that uses libtorrent. The goal of this repository is to build qBittorrent for Windows on ARM64 (WoA).

Please go to [releases](https://github.com/minnyres/qbittorrent-windows-arm64/releases) for the latest binary files.

## How to build

We use [LLVM-Mingw](https://github.com/mstorsjo/llvm-mingw) to build cross compile qBittorrent ARM64 on GNU/Linux systems. A [workflow file](https://github.com/minnyres/qbittorrent-windows-arm64/blob/main/.github/workflows/ci_mingw_arm64.yaml) is written to automatically build with Github actions.

