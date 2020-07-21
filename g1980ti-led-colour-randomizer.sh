#!/bin/bash
INTERVAL=$1
PREVIOUS_COLOUR=0
colours=([0]=0x14 [1]=0x11 [2]=0x12 [3]=0x13 [4]=0x15 [5]=0x16 [6]=0x17)
while true
do
    SELECTED_COLOUR=${colours[$RANDOM % ${#colours[@]}]}
    if [ $SELECTED_COLOUR = $PREVIOUS_COLOUR ]
    then
        continue
    fi
    for i in 1 2 3 4
    do
        sudo i2cset -y 2 0x48 "$SELECTED_COLOUR" 0x00
    done
    PREVIOUS_COLOUR=$SELECTED_COLOUR
    sleep $INTERVAL
done
