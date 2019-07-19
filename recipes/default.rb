#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# node.default['ssh']['hosts'] = [
#   { name: 'build-server',
#     hostname: '10.0.0.1' ,
#     user: 'builder',
#     identityfile: '~/.ssh/keyfile'
#   }
# ]

# template '/root/.ssh/config' do
#   source 'ssh_config.erb'
#   mode '0600'
#   variables(hosts: node['ssh']['hosts'])
# end


# ssh_config 'root' do
#   #TODO: figure out the path of the user based on the user
#   hosts node['ssh']['hosts']
# end


ssh_config_host 'build-server' do
  # owner 'root' default to root or whomever applying with chef-client  
  # name 'build-server'
  hostname '10.0.0.1'
  user 'builder'
  identityfile '~/.ssh/keyfile'
end
