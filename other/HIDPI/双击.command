#!/bin/sh

VendorID=$(ioreg -l | grep "DisplayVendorID" | awk '{print $8}')
ProductID=$(ioreg -l | grep "DisplayProductID" | awk '{print $8}')
EDID=$(ioreg -l | grep "IODisplayEDID" | awk '{print $8}' | sed -e 's/.$//' -e 's/^.//')

Vid=$(echo "obase=16;$VendorID" | bc | tr 'A-Z' 'a-z')
Pid=$(echo "obase=16;$ProductID" | bc | tr 'A-Z' 'a-z')

edID=$(echo $EDID | sed 's/../b5/21')

EDid=$(echo $edID | xxd -r -p | base64)
thisDir=$(dirname $0)
thatDir="/System/Library/Displays/Contents/Resources/Overrides"

Overrides="\/System\/Library\/Displays\/Contents\/Resources\/Overrides\/"

DICON="com\.apple\.cinema-display"

imacicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a032.tiff"

mbpicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a030-9d9da0.tiff"

mbicon=${Overrides}"DisplayVendorID-610\/DisplayProductID-a028-9d9da0.tiff"

lgicon=${Overrides}"DisplayVendorID-1e6d\/DisplayProductID-5b11.tiff"

function choose_icon(){
#
mkdir $thisDir/tmp/
cp $thisDir/Icons.plist $thisDir/tmp/

cat << EOF
----------------------------------------
|********** 选择要显示的ICON ***********|
----------------------------------------
(1) iMac
(2) MacBook
(3) MacBook Pro
(4) LG 显示器
(5) 保持原样

EOF
read -p "输入你的选择[1~4]: " logo
case $logo in
    1) Picon=$imacicon
RP=("33" "68" "160" "90")
;;
2) Picon=$mbicon
RP=("52" "66" "122" "76")
;;
3) Picon=$mbpicon
RP=("40" "62" "147" "92")
;;
4) Picon=$lgicon
RP=("11" "47" "202" "114")
DICON=${Overrides}"DisplayVendorID-1e6d\/DisplayProductID-5b11.icns"
;;
5) rm -rf $thisDir/tmp/Icons.plist
;;
*) echo "拜拜";
exit 0
;;
esac 

if [[ $Picon ]]; then
    sed -i '' "s/VID/$Vid/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/PID/$Pid/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPX/${RP[0]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPY/${RP[1]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPW/${RP[2]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/RPH/${RP[3]}/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/PICON/$Picon/g" $thisDir/tmp/Icons.plist
    sed -i '' "s/DICON/$DICON/g" $thisDir/tmp/Icons.plist
fi

}

function enable_hidpi(){
    
    #
    choose_icon
    mkdir -p $thisDir/tmp/DisplayVendorID-$Vid
    dpiFile=$thisDir/tmp/DisplayVendorID-$Vid/DisplayProductID-$Pid
    sudo chmod -R 777 $thisDir

# 
cat > "$dpiFile" <<-\HIDPI
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>DisplayProductID</key>
            <integer>PID</integer>
        <key>DisplayVendorID</key>
            <integer>VID</integer>
        <key>DisplayProductName</key>
            <string>Color LCD</string>
        <key>IODisplayEDID</key>
            <data>
            EDid
            </data>
        <key>scale-resolutions</key>
            <array>
                <data>
                AAAMgAAABkAA
                </data>
                <data>
                AAAMgAAABwgA
                </data>
                <data>
                AAALQAAABlQA
                </data>
            </array>
        <key>target-default-ppmm</key>
            <real>10.1510574</real>
    </dict>
</plist>
HIDPI

    #
    sed -i '' "s/VID/$VendorID/g" $dpiFile
    sed -i '' "s/PID/$ProductID/g" $dpiFile
    sed -i '' "s:EDid:${EDid}:g" $dpiFile

    sudo cp -r $thisDir/tmp/* $thatDir/
    rm -rf $thisDir/tmp
    echo "开启成功，重启生效"
    echo "首次重启开机logo会变得巨大，之后就不会了"

}

function start(){
# 
cat << EOF
----------------------------------------
|*************** HIDPI ****************|
----------------------------------------
(1) 开启HIDPI（同时注入修复花屏后的EDID）
(2) 关闭HIDPI

EOF
read -p "输入你的选择[1~2]: " input
case $input in
    1) enable_hidpi
;;
2) sudo rm -rf $thatDir/DisplayVendorID-$Vid && echo "已关闭，重启生效"
;;
*) echo "拜拜";
exit 0
;;
esac 
}

start