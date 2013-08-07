#!/bin/sh
qemu-system-i386 -hda dralinux.img -kernel vmlinuz -append "root=/dev/sda rw"
