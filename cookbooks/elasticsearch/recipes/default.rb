#
# Cookbook Name:: searchnode
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

apt_package "openjdk-7-jdk"

elasticsearch_package_remote_url = "https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.1.deb"
elasticsearch_package = File.basename elasticsearch_package_remote_url

local_package_path = "#{Chef::Config[:file_cache_path]}/#{elasticsearch_package}"

remote_file local_package_path do
  source elasticsearch_package_remote_url
end

dpkg_package "elasticsearch" do
  source local_package_path
  notifies :run, "execute[enable_elasticsearch]", :immediately
end

execute "enable_elasticsearch" do
  command "update-rc.d elasticsearch defaults 95 10"
  action :nothing
  notifies :run, "execute[start_elasticsearch]", :immediately
end

execute "start_elasticsearch" do
  command "/etc/init.d/elasticsearch start"
  action :nothing
end
