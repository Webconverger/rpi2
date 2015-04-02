# Setup

Based on <http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2>

NOTE: On my system: `sd=/dev/sdb`. This is the device of my microSD card discovered via `dmesg` or `lsblk`.

Start fdisk to partition the SD card: `# fdisk $sd` Warning: All data will be deleted from the  microSD card.

* At the fdisk prompt, delete old partitions and create a new one:
	* Type o. This will clear out any partitions on the drive.
	* Type p to list partitions. There should be no partitions left.
	* Type n, then p for primary, 1 for the first partition on the drive, press ENTER to accept the default first sector, then type +100M for the last sector.
	* Type t, then c to set the first partition to type W95 FAT32 (LBA).
	* Type n, then p for primary, 2 for the second partition on the drive, and then press ENTER twice to accept the default first and last sector.
	* Write the partition table and exit by typing w.

So now we have 1 partition with 100M formatted as fat so the Rpi2 can bootstrap
the Linux kernel. And the 2nd partition is the actual operating system rootfs.

Lets setup the rootfs:

	mkfs.ext4 ${sd}2
	mkdir /mnt/$(basename ${sd})2
	mount ${sd}2 /mnt/$(basename ${sd})2

Now, lets fetch the Webconverger rootfs for rpi2 from Github as your super user:

	sdb2# git init
	Initialized empty Git repository in /mnt/sdb2/.git/
	sdb2# git remote add origin https://github.com/Webconverger/rpi2.git
	sdb2# git pull origin master
	sdb2# bash ./.gitfixups # create some missing empty directories, since git doesn't store empty dirs

Ok, we should have all the files! Now we need to copy over the kernel stuff
into the special first fat partition for the Rpi to boot.

	/mnt# sudo mount ${sd}1 /mnt/$(basename ${sd})1
	/mnt# cd /mnt/$(basename ${sd})1
	/mnt/sdb1# sudo cp -r ../$(basename ${sd})2/boot/* .

## For the developer

	sudo chown -R $USER .git/
	git remote set-url --push origin git@github.com:Webconverger/rpi2.git
	git push -u origin master

In your [configuration](https://config.webconverger.com/):

	boot_append=debug

Or append `debug` in the fat partition's `cmdline.txt`
