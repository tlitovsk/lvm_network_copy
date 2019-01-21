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
    docker_config.vm.provision "shell", path: "setup_data_origin.sh"
  end

  config.vm.define "dest" do |docker_config|
    docker_config.vm.network "private_network", ip: "192.168.50.11"
    docker_config.vm.host_name = "dest"
    docker_config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    docker_config.vm.provision "shell", path: "setup_data_dest.sh"
  end
  
  
end




