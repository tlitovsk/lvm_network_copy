#!/bin/bash

sudo /bin/bash -xe <<EOF 
lvcreate --name dbvl --size 1G ubuntu-vg
mkdir /mnt/test
apt-get install -y sshpass pv
EOF

sudo -u vagrant /bin/bash <<EOF
export HOME=/home/vagrant

ssh-keygen -b 2048 -t rsa -q -N "" -f /home/vagrant/.ssh/id_rsa
ssh-keyscan origin >> /home/vagrant/.ssh/known_hosts
sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@origin
EOF