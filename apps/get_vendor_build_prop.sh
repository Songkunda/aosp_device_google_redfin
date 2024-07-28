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

# 从设备中拉取build.prop文件
adb pull /vendor/build.prop

cp build.prop build.prop.bak

# 修改build.prop文件中的ro.control_privapp_permissions值为log
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/\(ro\.control_privapp_permissions=\).*/\1log/' build.prop
else
    sed -i 's/\(ro\.control_privapp_permissions=\).*/\1log/' build.prop
fi

# 确保vendor分区被挂载为读写模式
adb shell mount -o rw,remount /vendor

# 将修改后的build.prop文件推送回设备
adb push build.prop /vendor/

# 重启设备
adb reboot

# 等待设备重启并启动logcat，过滤priv相关日志
adb wait-for-device
adb logcat | grep priv
