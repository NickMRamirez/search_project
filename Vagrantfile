# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.define "search_node" do |node|
    node.vm.box = "larryli/utopic64" # Ubuntu 14.10
    node.vm.network "forwarded_port", guest: 9200, host: 9200 # elasticsearch port

    node.vm.provision "chef_solo" do |chef|
      chef.add_recipe "logstash"
      chef.add_recipe "elasticsearch"
    end
  end
end
