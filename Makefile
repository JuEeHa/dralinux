all: rootfs image

rootfs:
	@sh build.sh
image:
	@sh genimg.sh
	@cp fs/boot/vmlinuz-* vmlinuz

dist-clean: clean-build clean-fs clean-cross clean-src clean-img clean-binpkg

clean-src:
	rm -rf src/*
clean-build:
	rm -rf build/*
clean-cross:
	rm -rf cross-tools/*
clean-fs:
	rm -rf fs/*
clean-img:
	rm -f dralinux.img vmlinuz
clean-binpkg:
	rm -rf bin-pkg/*
