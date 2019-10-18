## MacOS with xps-9360

### 使用情况

- [x] 声音
- [x] 显卡
- [x] 网卡
- [x] 雷电口热拔插
- [x] 触摸板
- [x] 睡眠
- [x] 蓝牙
- [x] 变频
- [x] 睡眠变频
- [ ] iMessage


### 配置

型号 : 戴尔XPS 13-9360-R3905S

CPU : i7-8550U

显卡 : HD620

网卡 : DW1830

内存 : 16G

硬盘 : SM961(256G)

BIOS版本 : 2.9.0

### 驱动版本


AirportBrcmFixup 2.0.3

AppleALC 1.4.1

BrcmPatchRam 2.2.12

Clover 5096

CPUFriend 1.1.9

Lilu 1.3.8

USBInjectAll0.7.1

VirtualSMC 1.0.8

VoodooPS2 1.9.2

WhateverGreen 1.3.1


### 安装前准备

1. 更换硬盘, PM981安装过程中无法识别,故需更换硬盘,推荐 SM961

2. 更换网卡,内置 killer1535 网卡无法驱动,故需更换网卡,推荐 DW1560/DW1830,DW1830有三根天线,原装网卡两根天线接口,所以需要加接口

3. 升级 BIOS, 升级最新即可

4. 调整 DVMT 值,参考 the-darkvoid（非常重要）

### 安装过程

1. 使用黑果小兵的系统及 EFI 进行安装,安装过程中会报两次错误,第一次报错重启继续安装,第二次报错后重启使用我的 EFI 文件进入系统即可

2. 使用 xps9360.sh 打开第三方应用权限

3. 执行命令开启 HIDPI ,把分辨率设为1440*810,显示更清楚

### 致谢

### [the-darkvoid](https://github.com/the-darkvoid/XPS9360-macOS)

### [triton21](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1769152&highlight=hidpi)
