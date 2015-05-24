#
# Cookbook Name:: elklogging
# Recipe:: elasticsearch
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

apt_package "openjdk-7-jdk"

apt_repository 'elasticsearch' do
  uri 'http://packages.elasticsearch.org/elasticsearch/1.4/debian'
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_package 'elasticsearch'

service 'elasticsearch' do
  action [:enable, :start]
end