## MacOS with xps-9360

### 正常使用
 
| 选项 | 状态 | 选项 | 状态 
| :---: | :---: | :---:| :---: |
声音/录音| 完美 |睡眠| 完美 |
显卡| 完美 |蓝牙| 完美 |
无线网卡| 完美 |变频| 完美 |
TypeC| 完美 |触摸板| 完美 |
摄像头| 完美 |

### Todo

[x] imessage/facetime 

### 配置
|配置|参数
|:---:|:---:|
电脑型号 | XPS 13-9360-R3905S
CPU | i7-8550U
显卡 | HD620
网卡蓝牙 | DW1830
内存 | 16G
硬盘 | SM961(256G)
BIOS版本 | 2.9.0

### 驱动版本

驱动|版本|驱动|版本
:---:|:---:|:---:|:---:
AirportBrcmFixup|2.0.7|Lilu|1.4.5
AppleALC|1.5.0|USBInjectAll|0.7.1
BrcmPatchRam|2.5.3|VirtualSMC|1.1.4
Clover|5119|VoodooPS2|2.1.1
CPUFriend|1.2.0|WhateverGreen|1.4.0
VoodooI2C|2.4.2|VoodooInput|1.0.5

### 安装前准备

1. 更换硬盘, PM981安装过程中无法识别,故需更换硬盘,推荐 SM961

2. 更换网卡,内置 killer1535 网卡无法驱动,故需更换网卡,推荐 DW1560/DW1830,DW1830有三根天线,原装网卡两根天线接口,所以需要加接口

3. 升级 BIOS, 升级到2.9.0，最新版本没有测试过

4. **调整 DVMT 值,参考 the-darkvoid（非常重要）**

### 安装过程

1. 使用黑果小兵的系统及 EFI 进行安装,安装过程中会报两次错误,第一次报错重启继续安装,第二次报错后重启使用我的 EFI 文件进入系统

2.  进入系统使用Clover Configurator生成新的机型参数

### 小优化

1. 打开第三方应用权限, 参考[the-darkvoid](https://github.com/the-darkvoid/XPS9360-macOS)

2. 开启HIDPI,把分辨率设为1440*810,显示更清楚，参考[xzhih](https://github.com/the-Quert/XPS-9360-macOS)

3.  使用 hackintosh 定制USB, 参考[黑果小兵](https://blog.daliansky.net/Intel-FB-Patcher-USB-Custom-Video.html)

### 致谢

### [the-darkvoid](https://github.com/the-darkvoid/XPS9360-macOS)

### [the-Quert](https://github.com/the-Quert/XPS-9360-macOS)

### [xzhih](https://github.com/xzhih/one-key-hidpi)

### [黑果小兵](https://blog.daliansky.net/about/)
