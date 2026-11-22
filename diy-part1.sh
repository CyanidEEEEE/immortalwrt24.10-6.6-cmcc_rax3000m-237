#!/bin/bash
set -e

# PassWall2 official feeds (25.12 apk compatible)
echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main' >> feeds.conf.default

# Lucky v3.x (25.12 apk compatible)
git clone --depth 1 https://github.com/gdy666/luci-app-lucky.git package/lucky
