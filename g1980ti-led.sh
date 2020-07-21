#!/bin/bash
COLOUR=$1
declare -A colours
colours=(["blue"]=0x14 ["red"]=0x11 ["green"]=0x12 ["yellow"]=0x13 ["magenta"]=0x15 ["cyan"]=0x16 ["white"]=0x17 ["off"]=0x21)
sudo modprobe i2c-dev
for i in 1 2 3 4
do
    sudo i2cset -y 2 0x48 "${colours["$COLOUR"]}" 0x00
done
