#Intro

Lets play a little bit with copying LVM snapshots across.
Maybe usefull for copying DB's snapshots in the background.
No warranties or guaranties may put you system on fire.

#Required Vagrant plugins

- vagrant plugin install vagrant-hostmanager

#How to run

- Install the needed plugins
- vagrant up
- vagrant ssh dest 
- ssh vagrant@origin -C 'sudo dd if=/dev/urandom of=/mnt/test/db4.txt bs=1 count=100000000' & ssh vagrant@origin -C 'sudo dd if=/dev/ubuntu-vg/exportdb2 bs=1M' | pv |sudo dd of=/dev/ubuntu-vg/dbvl
- sudo mount /dev/ubuntu-vg/dbvl /mnt/test 
- observe /mnt/test on both machines
- one will have db4 being writen and the other is clonning snapshot

