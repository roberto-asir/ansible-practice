# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "practicaelkroberto" do |elk|
    elk.vm.box = "ubuntu/focal64"
    elk.vm.box_check_update = false
    elk.vm.hostname = "practicaelkroberto"
    elk.vm.network "private_network", ip: "192.168.50.3", nic_type: "virtio", virtualbox__intnet: "practicasys"
    elk.vm.network "forwarded_port", guest: 80, host: 8080
    elk.vm.network "forwarded_port", guest: 9200, host: 9200
    elk.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
      vb.name = "practicaelkroberto"
      vb.default_nic_type = "virtio"
      file_to_disk2 = "extradisk2.vmdk"
      unless File.exist?(file_to_disk2)
          vb.customize [ "createmedium", "disk", "--filename", "extradisk2.vmdk", "--format", "vmdk", "--size", 1024 * 1 ]
      end
      vb.customize [ "storageattach", "practicaelkroberto" , "--storagectl", "SCSI", "--port", "3", "--device", "0", "--type", "hdd", "--medium", file_to_disk2]
    end
    elk.vm.provision "ansible" do |ansible|
#      ansible.verbose = "v"
      ansible.playbook = "playbooks/practicaelk.yaml"
    end
  end

  config.vm.define "practicawproberto" do |wp|
    wp.vm.box = "ubuntu/focal64"
    wp.vm.box_check_update = false
    wp.vm.hostname = "practicawproberto"
    wp.vm.network "private_network", ip: "192.168.50.4", nic_type: "virtio", virtualbox__intnet: "practicasys"
    wp.vm.network "forwarded_port", guest: 80, host: 8081
    wp.vm.provision "ansible" do |ansible|
#      ansible.verbose = "v"
      ansible.playbook = "playbooks/practicawp.yaml"
    end
    wp.vm.provider "virtualbox" do |vb|
      vb.name = "practicawproberto"
      vb.memory = "1024"
      vb.cpus = 1
      vb.default_nic_type = "virtio"
      file_to_disk1 = "extradisk1.vmdk"
      unless File.exist?(file_to_disk1)
          vb.customize [ "createmedium", "disk", "--filename", "extradisk1.vmdk", "--format", "vmdk", "--size", 1024 * 1 ]
      end
      vb.customize [ "storageattach", "practicawproberto" , "--storagectl", "SCSI", "--port", "2", "--device", "0", "--type", "hdd", "--medium", file_to_disk1]
    end
  end 
 
end
