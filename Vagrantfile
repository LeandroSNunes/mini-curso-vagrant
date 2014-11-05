# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "leandrosnunes/precise64"

  config.vm.network "private_network", ip: "192.168.33.30"
  config.vm.network :forwarded_port, guest: 3000, host: 3000 # rails
  config.vm.network :forwarded_port, guest: 3306, host: 3306 # mysql

  config.vm.post_up_message = "Mini curso de vagrant\n IP: 192.168.33.30"

end
