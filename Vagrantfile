# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.define 'logserver' do |node|
    node.vm.box = 'larryli/utopic64' # Ubuntu 14.10
	node.vm.hostname = 'logserver'
	node.vm.network 'private_network', type: 'dhcp'
	
    node.vm.provision 'chef_zero' do |chef|
      chef.roles_path = 'roles'
      chef.add_role 'logserver'
    end
  end
end
