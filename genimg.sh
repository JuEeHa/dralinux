#!/bin/sh -x
BLOCKS=$(((1024*$(du -m -s fs | cut -f 1)*12)/10))
genext2fs -z -d fs/ -U -i 1024 -b $BLOCKS dralinux.img
resize2fs dralinux.img 500M
