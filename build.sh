#!/bin/sh
A=$(uname -m) export A
T=$(pwd) export T
S=$T/src export S
P=$T/patch export P
R=$T/fs export R

PATH=$T/util:$T/cross-tools/bin:$PATH export PATH

test -d build || mkdir build
test -d src || mkdir src
test -d cross-tools || mkdir cross-tools
test -d fs || mkdir fs

echo Building for $A

build-pkg cross-pkg/binutils || exit 1
build-pkg cross-pkg/gcc || exit 1

CC="$A-unknown-linux-musl-gcc" export CC
CFLAGS="-Os" export CFLAGS
LDFLAGS="-s" export LDFLAGS

build-pkg cross-pkg/linux-headers || exit 1
build-pkg cross-pkg/musl || exit 1

for i in pkg/*
do
	build-pkg $i || exit 1
done

cp -r files/* fs/
