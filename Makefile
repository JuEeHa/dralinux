all: rootfs image

rootfs:
	@sh build.sh
image:
	@sh genimg.sh
	@cp fs/boot/vmlinuz-* vmlinuz

clean: clean-build clean-fs clean-cross clean-src clean-img

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
