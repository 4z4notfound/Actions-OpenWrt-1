#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# Docker
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker
if [ -e feeds/packages/utils/docker-ce ];then
	sed -i '/dockerd/d' package/luci-app-dockerman/Makefile
	sed -i 's/+docker/+docker-ce/g' package/luci-app-dockerman/Makefile
fi

#PASSWALL
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/luci-app-passwall
