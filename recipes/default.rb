#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory '/root/.ssh' do
  recursive true
end

file '/root/.ssh/config' do
  content 'MaxSessions 250'
end
