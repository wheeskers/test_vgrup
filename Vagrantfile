# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "herroffizier-VAGRANTSLASH-centos-6.5-i686"
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: "early_provision.sh"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "centos6_manifests"
    puppet.manifest_file = "manifest.pp"
  end

  # -- extra --
  config.vm.network "forwarded_port", guest: 80, host: 8001

end
