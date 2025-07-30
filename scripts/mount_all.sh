mount -vt ext4 /dev/sda6 $LFS
mount -vt ext2 /dev/sda4 $LFS/boot
mount -vt vfat /dev/sda3 $LFS/boot/efi
/sbin/swapon -v /dev/sda5

mount -v --bind /dev $LFS/dev
mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
	install -v -d -m 1777 $LFS$(realpath /dev/shm)
else
	mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi
