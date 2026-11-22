# CMCC RAX3000M ImmortalWrt 25.12 (Linux 6.12) 闭源驱动轻 NAS 固件

基于 [`chasey-dev/immortalwrt-mt798x-rebase`](https://github.com/chasey-dev/immortalwrt-mt798x-rebase) `25.12` 分支（Linux 6.12 + MTK 闭源无线驱动 + WED v2 / HNAT 硬件加速）自动云编译。

## 固件信息

- **分支**：`openwrt-25.12`（保留 `openwrt-24.10-6.6` 旧分支可随时回滚）
- **目标设备**：CMCC RAX3000M（128M NAND，主线 U-Bootmod FIT 布局，产物为 `sysupgrade.itb`）
- **管理后台**：`192.168.212.1` | 账号：`root` | 密码：无 | 主题：`Argon`
- **包管理器**：`apk`（OpenWrt / ImmortalWrt 25.12 原生切换，已取代 `opkg`）

## 集成插件与文件系统

- **代理**：`luci-app-passwall2`（仅集成 `xray-core` + `nftables` 透明代理，已剔除 `sing-box` 与 `iptables` 冗余）
- **轻 NAS 服务**：`luci-app-ksmbd` + `wsdd2`、`luci-app-vsftpd`（不含 `openssh-sftp-server`）、原生 `luci-app-openlist`
- **磁盘与功耗**：`luci-app-diskman`、`luci-app-hd-idle`、`zram-swap`
- **文件系统与 USB**：`kmod-fs-btrfs` + `btrfs-progs`、`kmod-fs-ext4` + `e2fsprogs`、`kmod-fs-ntfs3` + `ntfs3-mount` + `ntfs-3g-utils` + `kmod-nls-utf8`、`kmod-fs-exfat`、`kmod-fs-vfat`、`kmod-usb-storage` + `kmod-usb-storage-uas` + `kmod-usb3`
- **常用工具**：`luci-app-ttyd`、`luci-app-lucky`、`luci-app-zerotier`

## 使用与刷机注意事项

1. **禁止保留配置升级**：从 24.10（`opkg` / 6.6）跨大版本刷入 25.12（`apk` / 6.12）时，请务必取消勾选“保留配置”，刷机后清理浏览器缓存。
2. **OpenList 路径设置**：首次启动后请在 OpenList 配置中将数据目录与临时缓存目录指到外挂硬盘，避免写入 128M NAND overlay。
3. **硬件加速互斥**：固件默认启用 MTK HNAT + WED 硬件加速，请勿在防火墙或 TurboACC 中额外开启软件/硬件 Flow Offloading，否则可能引发冲突重启。
4. **定时更新检查**：如需每日自动检测上游更新生效，请在 GitHub 仓库 `Settings → General → Default branch` 将默认分支切换为 `openwrt-25.12`。
