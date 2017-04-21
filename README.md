# Installing Webconverger

###### **NOTE:** There are no support for Windows and OSX installation currently

## Installing from Linux

1. Identify the partition of microSD card

Run `sudo fdisk -l`, insert the microSD card and re-run `sudo fdisk -l` again. Identify the newly inserted device which **partition** is normally `/dev/sdc` or `/dev/mmcblk0`, then export it as variable and then as root:

	$ sudo -i
	# export sd=/dev/mmcblk0

2. Format the SD card

**Warning:** This will destroy all the data from the microSD card.

Run `fdisk $sd` and type in the following (_**`<E>`** means enter, ignore the spaces_):

	o <E> n <E> <E> <E> +30M <E> t <E> c <E> n <E> <E> <E> w <E>

For your information, this will create 2 partitions on the disk (`fat32` and `linux`).

3. Installation

Build the Linux filesystem

	# mkfs.vfat ${sd}p1
	# mkfs.ext4 ${sd}p2

Mount the partitions

	# mkdir -p /mnt/boot /mnt/root
	# mount ${sd}p1 /mnt/boot
	# mount ${sd}p2 /mnt/root

Download Webconverger (*be patient*)

	# cd /mnt/root
	# git init
	# git remote add origin https://github.com/Webconverger/rpi2.git
	# git pull origin master

Setup the boot partition

	# cp -r /mnt/root/boot/* /mnt/boot/

Unmount the partitions and ready to go

	# sync
	# umount /mnt/boot /mnt/root

For more info, please refer to <https://Webconverger.org/rpi2/>.

# For developer

## Debug mode

Add `boot_append=debug` to your [configuration](https://config.Webconverger.com/) or append `debug` to fat partition's `cmdline.txt`

# References

Arch Linux ARM installation - <https://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2>
