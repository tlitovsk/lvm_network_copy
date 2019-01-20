$workers=1

$script_for_origin = <<-SCRIPT
sudo lvcreate --name dbvl --size 1G ubuntu-vg
sudo mkfs.ext4 /dev/disk/by-id/dm-name-ubuntu--vg-dbvl
sudo mkdir /mnt/test
sudo mount /dev/disk/by-id/dm-name-ubuntu--vg-dbvl /mnt/test
sudo dd if=/dev/urandom of=/mnt/test/db1.txt bs=1M count=512
sudo lvcreate --size 1G --snapshot --name exportdb1 /dev/ubuntu-vg/dbvl
sudo dd if=/dev/urandom of=/mnt/test/db2.txt bs=1M count=128
sudo lvcreate --size 1G --snapshot --name exportdb2 /dev/ubuntu-vg/dbvl
sudo dd if=/dev/urandom of=/mnt/test/db3.txt bs=1M count=128
SCRIPT

$script_for_dest = <<-SCRIPT
sudo lvcreate --name dbvl --size 1G ubuntu-vg
sudo apt-get install sshpass
ssh-keygen -b 2048 -t rsa -q -N ""
ssh-keyscan origin >> /home/vagrant/.ssh/known_hosts
sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@origin
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "tlitovsk/ubuntu_18_04_01_lvm"
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true

  config.vm.define "origin" do |docker_config|
    docker_config.vm.network "private_network", ip: "192.168.50.10"
    docker_config.vm.host_name = "origin"
    docker_config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    docker_config.vm.provision "shell", inline: $script_for_origin
  end

  config.vm.define "dest" do |docker_config|
    docker_config.vm.network "private_network", ip: "192.168.50.11"
    docker_config.vm.host_name = "dest"
    docker_config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    docker_config.vm.provision "shell", inline: $script_for_dest
  end
  
  
end




