# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "leandrosnunes/precise64"

  config.vm.define :development do |dev|
    dev.vm.network "private_network", ip: "192.168.33.30"
    dev.vm.network :forwarded_port, guest: 3306, host: 3306 # mysql

    dev.vm.post_up_message = "Dev mini curso de vagrant\n IP: 192.168.33.30"
  end

  config.vm.define :production do |pro|
    pro.vm.network "private_network", ip: "192.168.33.31"

    pro.vm.post_up_message = "Prod mini curso de vagrant\n IP: 192.168.33.31"
  end
end
