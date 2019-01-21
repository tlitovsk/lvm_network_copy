#!/bin/bash -xe

sudo /bin/bash -xe <<EOF
    lvcreate --name dbvl --size 1G ubuntu-vg
    mkfs.ext4 /dev/disk/by-id/dm-name-ubuntu--vg-dbvl
    mkdir /mnt/test
    mount /dev/disk/by-id/dm-name-ubuntu--vg-dbvl /mnt/test
    dd if=/dev/urandom of=/mnt/test/db1.txt bs=1M count=512
    lvcreate --size 1G --snapshot --name exportdb1 /dev/ubuntu-vg/dbvl
    dd if=/dev/urandom of=/mnt/test/db2.txt bs=1M count=128
    lvcreate --size 1G --snapshot --name exportdb2 /dev/ubuntu-vg/dbvl
    dd if=/dev/urandom of=/mnt/test/db3.txt bs=1M count=128
EOF