# Attach a volume to an EC2 Instance

SSH into the EC2 instance

use `lsblk` to get the device name, full path is now /dev/<name of device>

# check if vol is already init with a file system
`sudo file -s /dev/<name_of_device>` - 1

if output is just `data` then there is no filesystem on it, make one on it now

`mkfs -t [ext4| XFS] /dev/<name_of_device>` (may need sudo)

run `1` again to ensure it is written to the block device

# mounting it

make a mount point in the main directory, I prefer `/data`

`mkdir /data` (may need sudo)

then mount with

`mount /dev/<name_of_device> /data` (may need sudo)

to mount the volume on reboot, add it to the fstab file

> NOTE: create a backup of the current fstab file first by doing `sudo cp /etc/fstab /etc/fstab.orig`

## get UUID of block device
use blkid to get the device uuid

`sudo blkid`

For Ubuntu 18.04 use the lsblk command.

`sudo lsblk -o +UUID`

## edit fstab

`sudo vim /etc/fstab`
add the line 
UUID=<blk dev uuid here>  /data  xfs  defaults,nofail  0  2

> NOTE: If you ever boot your instance without this volume attached (for example, after moving the volume to another instance), the nofail mount option enables the instance to boot even if there are errors mounting the volume. Debian derivatives, including Ubuntu versions earlier than 16.04, must also add the nobootwait mount option.

To verify that your entry works, run the following commands to unmount the device and then mount all file systems in `/etc/fstab`. If there are no errors, the /etc/fstab file is OK and your file system will mount automatically after it is rebooted.

`sudo umount /data`
`sudo mount -a`

> WARNING: Errors in the /etc/fstab file can render a system unbootable. Do not shut down a system that has errors in the /etc/fstab file.

if errors do occur, please copy back the .orig file and start again
