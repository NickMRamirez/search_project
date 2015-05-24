#
# Cookbook Name:: elklogging
# Recipe:: default
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

include_recipe 'elklogging::logstash'
include_recipe 'elklogging::elasticsearch'