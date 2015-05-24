#
# Cookbook Name:: elklogging
# Recipe:: logstash
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

apt_repository 'logstash' do
  uri 'http://packages.elasticsearch.org/logstash/1.5/debian'
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_package 'logstash'

service 'logstash' do
  action :start
end