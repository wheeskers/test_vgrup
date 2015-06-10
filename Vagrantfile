# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "herroffizier-VAGRANTSLASH-centos-6.5-i686"
  config.vm.box_check_update = false

   config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "1024"
   end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "centos6_manifests"
    puppet.manifest_file = "manifest.pp"
  end

  # -- extra --
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"


end
