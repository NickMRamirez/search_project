#
# Cookbook Name:: logstash
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

logstash_package_remote_url = "https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz"
logstash_package = File.basename logstash_package_remote_url
local_package_path = "#{Chef::Config[:file_cache_path]}/#{logstash_package}"
target_directory = '/opt'

directory target_directory

remote_file local_package_path do
  source logstash_package_remote_url
  notifies :run, "execute[extract_logstash]", :immediately
end

execute "extract_logstash" do
  command "tar -zvxf #{local_package_path} -C #{target_directory}"
  action :nothing
end
