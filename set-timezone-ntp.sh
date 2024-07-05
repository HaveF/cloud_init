#!/bin/sh
# 设置时区为中国时区并启用时间同步

timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true

