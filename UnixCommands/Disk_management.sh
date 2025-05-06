df
Example: df -h
-h – human-readable (e.g., shows sizes in KB/MB/GB)
Explanation: Displays disk space usage of file systems in a readable format.

du
Example: du -sh /home/user
-s – summarize total size
-h – human-readable format
Explanation: Estimates the size of directories or files; here it shows only the total size of /home/user.

fdisk
Example: sudo fdisk /dev/sda
Explanation: Opens a partition table editor for the specified disk. Used to create, delete, or change partitions (requires sudo).

lsblk
Example: lsblk
Explanation: Lists all block devices (hard drives, SSDs, partitions) in a tree structure showing relationships and mount points.

mount
Example: sudo mount /dev/sdb1 /mnt
Explanation: Mounts the device /dev/sdb1 to the /mnt directory so it can be accessed through the file system.

umount
Example: sudo umount /mnt
Explanation: Unmounts a mounted filesystem or device, making it safely removable.

parted
Example: sudo parted /dev/sda
Explanation: Launches a modern partitioning tool for GPT/MBR partitions. Useful for creating and resizing partitions.

mkfs
Example: sudo mkfs.ext4 /dev/sdb1
Explanation: Formats the device /dev/sdb1 with the ext4 file system. Destroys existing data on the partition.

fsck
Example: sudo fsck /dev/sdb1
Explanation: Checks the filesystem on a device for errors and repairs them if needed.

blkid
Example: blkid
Explanation: Displays UUIDs and other metadata for all block devices. Useful for identifying devices in fstab or scripts.