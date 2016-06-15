# Define the Vagrant environment for Ansible 101
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Create the Ansible Command Server
  config.vm.define :acs do |acs|
    acs.vm.box = "ubuntu/trusty64"
    acs.vm.hostname = "acs"
    acs.vm.network "private_network", ip: "192.168.33.10"
    acs.vm.provider "virtualbox" do |vb|
      vb.memory = "256"
    end
  end

  #Create a load balancer
  config.vm.define :lb01 do |lb|
      lb.vm.box="ubuntu/trusty64"
      lb.vm.hostname = "lb01"
      lb.vm.network "private_network", ip: "192.168.33.20"
      lb.vm.network "forwarded_port", guest: 80, host: 6080
      lb.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

  # Create some web servers
  (1..3).each do |i|
    config.vm.define "web0#{i}" do |node|
        node.vm.box="ubuntu/trusty64"
        node.vm.hostname = "web0#{i}"
        node.vm.network :private_network, ip: "192.168.33.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "608#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
    end
	config.vm.synced_folder "../../wp-playbooks", "/root/wp-playbooks"
  end

  config.vm.define "db01" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.hostname = "db01"
    db.vm.network "private_network", ip: "192.168.33.50"
    db.vm.network "forwarded_port", guest: 80, host: 8080
    db.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
      config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
     end
  end
end
