## MacOS with xps-9360

### 使用情况

能想到的都完美了,除了触摸板不能双指手势

### 配置

型号 : 戴尔XPS 13-9360-R3905S

CPU : i7-8550U

显卡 : HD620

网卡 : DW1830

内存 : 16G

硬盘 : SM961(256G)

BIOS版本 : 2.5.1

系统版本 : 10.3.4 

### 安装前准备

1. 更换硬盘, PM981安装过程中无法识别,故需更换硬盘,推荐 SM961

2. 更换网卡,内置 killer1535 网卡无法驱动,故需更换网卡,推荐 DW1560/DW1830,DW1830有三根天线,原装网卡两根天线接口,所以需要加接口

3. 升级 BIOS, 升级最新即可

4. 调整 DVMT 值,参考 the-darkvoid 

### 安装过程

1. 使用[黑果小兵](https://blog.daliansky.net/macOS-High-Sierra-10.13.4-17E199-Release-Version-and-Clover-4418-Original-Image.html)的系统及 EFI 进行安装,安装过程中会报两次错误,第一次报错重启继续安装,第二次报错后重启使用我的 EFI 文件进入系统即可

2. 使用 xps9360.sh 中相关命令注入声音驱动,打开第三方应用权限

3. 执行命令开启 HIDPI ,把分辨率设为1440*810,显示更清楚

### 一些问题
1. 蓝牙问题,直接使用the-darkvoid的 CLOVER 会导致DW1830蓝牙无法驱动,具体表现为开机卡60s, 并提示 BCM2045A0 ,经过简单修改现在已经可以使用

2. 声音问题.插入耳机无法识别,解决方法 DSDT 中加入 SSDT-ALC256,SSDT-HDEF.耳机电流声,使用 the-darkvoid 的脚本文件 xps9360.sh解决.睡眠唤醒无声,将 config.list 中 boot 中 darkwake 值设为0

3. 触摸板驱动,使用 VoodooI2C 驱动使用双指即右击不灵敏,三指手势可用.使用VoodooPS2Controller不太好用

### 注意事项

1. 其他型号的电脑不要使用我的 EFI ,尤其是显卡不一样的电脑,请自己在 config.list 修改显卡仿冒值再尝试使用

2. 相对于 the-darkvoid,有以下改动

**driver64EFI**

    使用最新 CLOVER
    
**kexts**

    删除 FakePCID_* wifi原生驱动,不要仿冒

    删除 UVC2FaceTimeHD 不需要摄像头
    
    删除 VoodooI2C.kext
    
    添加 AirportBrcmfixup 5G网络支持
    
    添加 BrcmPatchRAM2 BrcmFirmwareData 蓝牙功能
    
    添加 Shiki 解决 Itunes 偶尔闪退

**themes** 

    添加主题文件
    
**ACPI**

    删除 SSDT-UIAC SSDT-USBX 感觉不需要
    
    删除 SSDT-IGPU 直接在 config 中仿冒,不需要动态patch
    
    删除 SSDT-I2C 因为双击不灵敏
    
### 致谢

### [the-darkvoid](https://github.com/the-darkvoid/XPS9360-macOS)

### [triton21](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1769152&highlight=hidpi)