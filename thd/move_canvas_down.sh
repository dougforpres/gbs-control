#!/bin/bash

sudo i2cset -r -y 1 0x17 0xf0 0x03 b
#HRST_VALUE=$(( (($(sudo i2cget -y 1 0x17 0x02) & 0x07) << 8) + $(sudo i2cget -y 1 0x17 0x01) ))
VRST_VALUE=$(( (($(sudo i2cget -y 1 0x17 0x03) & 0x7f) << 4) + ($(sudo i2cget -y 1 0x17 0x02) >> 4) ))
TOP_VALUE=$(( ( (($(sudo i2cget -y 1 0x17 0x08) & 0x07) << 8) + $(sudo i2cget -y 1 0x17 0x07) +1) ))
BOTTOM_VALUE=$(( ( (($(sudo i2cget -y 1 0x17 0x09) & 0x7f) << 4) + ($(sudo i2cget -y 1 0x17 0x08) >> 4) +1) ))
if [ $BOTTOM_VALUE -eq $VRST_VALUE ]
then
    BOTTOM_VALUE=0
fi
if [ $TOP_VALUE -eq $VRST_VALUE ]
then
    TOP_VALUE=0
fi
sudo i2cset -r -y -m 0x07 1 0x17 0x08 $((TOP_VALUE >> 8))
sudo i2cset -r -y -m 0xff 1 0x17 0x07 $((TOP_VALUE & 0xFF))
sudo i2cset -r -y -m 0x7f 1 0x17 0x09 $((BOTTOM_VALUE >> 4))
sudo i2cset -r -y -m 0xf0 1 0x17 0x08 $(( (BOTTOM_VALUE & 0x00F) << 4))