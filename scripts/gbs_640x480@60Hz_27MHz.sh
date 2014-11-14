#!/bin/bash

# Select register set 0
sudo i2cset -y -r 1 0x17 0xf0 0x00 b
# Set VCLK/V4CLK/V2CLK to 27/27/27Mhz
sudo i2cset -y -r 1 0x17 0x41 0x05 b

# Select register set 3
sudo i2cset -y -r 1 0x17 0xf0 0x03 b
# Turn off 1st and 2nd interpolation
# Mask 0000 0011, only set 2 lsb
sudo i2cset -y -r -m 0x03 1 0x17 0x40 0x03 b

# Set output mode: free run, AABB double field, output progressive
#sudo i2cset -y -r 1 0x17 0x00 0x00 b

# Set H and V total values 857x525x60.01hz = 27Mhz (inc. blank/sync)
#sudo i2cset -y -r 1 0x17 0x01 0x59 b
#sudo i2cset -y -r 1 0x17 0x02 0xd3 b
#sudo i2cset -y -r 1 0x17 0x03 0x20 b

# Set Fetch data blanking positions
#sudo i2cset -y -r 1 0x17 0x04 0x00 b
#sudo i2cset -y -r 1 0x17 0x05 0xb0 b
#sudo i2cset -y -r 1 0x17 0x06 0x00 b
#sudo i2cset -y -r 1 0x17 0x07 0x00 b
#sudo i2cset -y -r 1 0x17 0x08 0xa8 b
#sudo i2cset -y -r 1 0x17 0x09 0x81 b

