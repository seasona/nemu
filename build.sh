#!/bin/bash
set -e

if [[ "$EXTRA_CFLAGS" == "" ]]; then
    EXTRA_CFLAGS=" -O3 -fno-semantic-interposition -falign-functions=32 -D_FORTIFY_SOURCE=2 -fPIE"
fi

make distclean || true

./configure --target-list=x86_64-softmmu \
	--disable-docs \
	--disable-guest-agent \
	--disable-rbd \
	--disable-cocoa \
	--disable-fdt \
	--disable-libiscsi \
	--disable-libnfs \
	--disable-libssh2 \
	--disable-linux-aio \
	--disable-lzo \
	--disable-bzip2 \
	--disable-modules \
	--disable-netmap \
	--disable-qom-cast-debug \
	--disable-snappy \
	--disable-tcmalloc \
	--disable-tools \
	--disable-tpm \
	--disable-brlapi \
	--disable-virtfs \
	--disable-tcg \
	--disable-capstone \
	--disable-libusb \
	--disable-xen \
	--disable-xen-pci-passthrough \
	--disable-usb-redir \
	--disable-spice \
	--disable-vnc \
	--disable-whpx \
	--disable-hvf \
	--disable-gtk \
	--disable-vte \
	--disable-sdl \
	--disable-rdma \
	--disable-vxhs \
	--disable-gnutls \
	--disable-nettle \
	--disable-tpm \
	--enable-debug \
	--extra-cflags="$EXTRA_CFLAGS" \
 	--extra-ldflags=" -pie -z noexecstack -z relro -z now" \

$MAKEPREFIX make -j `nproc`
