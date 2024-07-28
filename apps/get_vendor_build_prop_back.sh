#!/bin/bash

# 获取root权限
adb root

# 重新挂载系统分区
adb remount

# 手动禁用verity并重新启动设备
adb disable-verity
adb reboot

# 等待设备重启
adb wait-for-device

# 再次获取root权限并重新挂载文件系统为读写模式
adb root
adb remount

cp build.prop.bak build.prop

# 确保vendor分区被挂载为读写模式
adb shell mount -o rw,remount /vendor

# 将修改后的build.prop文件推送回设备
adb push build.prop /vendor/

# 重启设备
adb reboot
