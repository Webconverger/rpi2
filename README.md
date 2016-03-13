# Setup

Based on <http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2>

NOTE: On my system: `sd=/dev/sdb`. This is the device of my microSD card discovered via `dmesg` or `lsblk`.

Start fdisk to partition the SD card: `# fdisk $sd` Warning: All data will be deleted from the  microSD card.

At the fdisk prompt, we will delete old partitions and create one **100M FAT32** boot partition and leave the rest for a **ext4** formatted root partition with the following commands:

1. Type `o`. This will clear out any partitions on the drive.
* Type `p` to list partitions. There should be no partitions left.
* Type `n`, then `p` for primary, 1 for the first partition on the drive, press ENTER to accept the default first sector, then type `+100M` for the last sector.
* Type `t`, then `c` to set the first partition to type W95 FAT32 (LBA).
* Type `n`, then `p` for primary, `2` for the second partition on the drive, and then press ENTER twice to accept the default first and last sector.
* Write the partition table and exit by typing `w`.

Lets setup the rootfs on the microSD card:

	# mkfs.ext4 ${sd}2
	# mkdir /mnt/$(basename ${sd})2
	# mount ${sd}2 /mnt/$(basename ${sd})2

Now, lets fetch the Webconverger rootfs for rpi2 from Github:

	sdb2# git init
	Initialized empty Git repository in /mnt/sdb2/.git/
	sdb2# git remote add origin https://github.com/Webconverger/rpi2.git # be patient!
	sdb2# git pull origin master

Ok, we should have all the files! Now we need to copy over the kernel stuff
into the special first fat partition for the Rpi2 to boot.

	/mnt# mkfs.vfat ${sd}1
	/mnt# mount ${sd}1 /mnt/$(basename ${sd})1
	/mnt# cd /mnt/$(basename ${sd})1
	/mnt/sdb1# cp -r ../$(basename ${sd})2/boot/* .

## For the developer

	git remote set-url --push origin git@github.com:Webconverger/rpi2.git
	git push -u origin master

In your [configuration](https://config.webconverger.com/):

	boot_append=debug

Or append `debug` in the fat partition's `cmdline.txt`
