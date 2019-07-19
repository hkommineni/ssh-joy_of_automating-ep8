#
# Cookbook:: ssh-joy_of_automating-ep8
# Recipe:: uses_ssh
#
# Copyright:: 2019, The Authors, All Rights Reserved.


node.default['ssh']['hosts'] = [
    { name: 'build-server2',
      hostname: '10.0.0.1' ,
      user: 'builder',
      identityfile: '~/.ssh/keyfile'
    },
    { name: 'art-server2',
      hostname: '10.0.0.2'
      user: 'artificer'
      identityfile: '~/.ssh/keyfile'
    }
  ]


include_recipe 'ssh::default'
