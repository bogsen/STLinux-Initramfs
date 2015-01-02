#!/bin/bash

KERNEL_PATH=../STLinux-Kernel

cd root
find . | cpio -o -H newc | gzip > ../initramfs.cpio.gz
cd ..

cat $KERNEL_PATH/arch/arm/boot/zImage $KERNEL_PATH/arch/arm/boot/dts/tegra124-tn8-p1761-1270-a04-e-battery.dtb > zImage

rm new_boot.img
tools/mkbootimg --kernel zImage --ramdisk initramfs.cpio.gz -o new_boot.img

rm initramfs.cpio.gz
rm zImage
