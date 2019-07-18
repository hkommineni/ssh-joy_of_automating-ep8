#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory '/root/.ssh' do
  recursive true
  mode '0600'
end

file '/root/.ssh/config' do
  mode '0600'
  content %{
Host *
    ForwardAgent no
    Port 22
Host build-server
    hostname 10.0.0.1
    user builder
    identityfile ~/.ssh/keyfile
  }
end
