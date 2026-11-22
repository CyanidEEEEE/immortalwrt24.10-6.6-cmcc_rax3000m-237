#!/bin/bash
set -e

# Set default LAN IP to 192.168.212.1
sed -i 's/192.168.1.1/192.168.212.1/g' package/base-files/files/bin/config_generate

# Set default LuCI theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
