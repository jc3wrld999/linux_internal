# 커널 모듈 빌드
ARCH=arm64 CROSS_COMPILE=gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu- make

# 커널 모듈을 빌드된 루트 파일 시스템에 복사
mount -o loop buildroot/output/images/rootfs.ext4 /mnt

mkdir /mnt/usr/lib/modules
cp drivers/sungch/sungch.ko /mnt/usr/lib/modules/. 
sync
umount /mnt

# qemu emulate
qemu-system-aarch64 \
  -kernel linux/arch/arm64/boot/Image \
  -drive format=raw,file=buildroot/output/images/rootfs.ext4,if=virtio \
  -append "root=/dev/vda console=ttyAMA0 nokaslr" \
  -nographic \
  -M virt \
  -cpu cortex-a72 \
  -m 2G \
  -smp 2