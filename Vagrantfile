# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "leandrosnunes/precise64"

  config.vm.define :development do |dev|
    dev.vm.network "private_network", ip: "192.168.33.30"
    dev.vm.network :forwarded_port, guest: 3306, host: 3306 # mysql

    dev.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
    end

    dev.vm.provision :puppet do |puppet|
      puppet.module_path   = "modules"
      puppet.manifest_file = "development.pp"
      puppet.options       = "--verbose --debug"
    end

    dev.vm.post_up_message = "Dev mini curso de vagrant\n IP: 192.168.33.30"
  end

  config.vm.define :production do |pro|
    pro.vm.network "private_network", ip: "192.168.33.31"

    pro.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end

    pro.vm.provision :puppet do |puppet|
      puppet.module_path   = "modules"
      puppet.manifest_file = "production.pp"
    end

    pro.vm.post_up_message = "Prod mini curso de vagrant\n IP: 192.168.33.31"
  end
end
