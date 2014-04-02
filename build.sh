#!/bin/sh
# Uncomment following line and comment one after it if you want a native build instead of i686
#A=$(uname -m) export A
A=i686 export A
T=$(pwd) export T
S=$T/src export S
P=$T/patch export P

PATH=$T/util:$T/cross-tools/bin:$PATH export PATH

test -d build || mkdir build
test -d src || mkdir src
test -d cross-tools || mkdir cross-tools
test -d bin-pkg || mkdir bin-pkg
test -d fs || mkdir fs

echo Building for $A

if test ! -e cross-tools/pkg_binutils
then
	build-pkg cross-pkg/binutils || exit 1
	touch cross-tools/pkg_binutils
fi
if test ! -e cross-tools/pkg_gcc
then
	build-pkg cross-pkg/gcc || exit 1
	touch cross-tools/pkg_gcc
fi

CC="$A-unknown-linux-musl-gcc" export CC
CFLAGS="-Os" export CFLAGS
LDFLAGS="-s" export LDFLAGS

if test ! -e  cross-tools/pkg_linux-headers
then
	build-pkg cross-pkg/linux-headers || exit 1
	touch cross-tools/pkg_linux-headers
fi
if test ! -e cross-tools/pkg_musl
then
	build-pkg cross-pkg/musl || exit 1
	touch cross-tools/pkg_musl
fi

test z"$1" = z"cross" && exit 0

for i in pkg/*
do
	if test ! -d bin-pkg/$(basename $i)
	then
		mkdir bin-pkg/$(basename $i)
		R=$T/bin-pkg/$(basename $i) build-pkg $i || exit 1
	fi
done

for i in bin-pkg/*
do
	cp -rf $i/* fs/
done
cp -rf files/* fs/
for i in dev etc mnt proc root srv sys tmp
do
	test -d fs/$i || mkdir -p fs/$i
done
