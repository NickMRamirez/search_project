# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.define 'logserver' do |node|
    node.vm.box = 'ubuntu/vivid64'
	  node.vm.hostname = 'logserver'
	  node.vm.network 'private_network', ip: '172.28.128.3'
	
	  # ELK requires more RAM
	  node.vm.provider :virtualbox do |vb|
	    vb.customize ['modifyvm', :id, '--memory', '2048']
	  end
	
    node.vm.provision 'chef_zero' do |chef|
      chef.roles_path = 'roles'
      chef.add_role 'logserver'
    end
  end
end
