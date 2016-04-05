#
# Cookbook Name:: corosync
# Provider:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#

action :create do
  # Create config directory
  directory node['corosync']['conf_dir'] do
    owner 'root'
    mode '0755'
    action :create
  end

  # Copy or create the key file
  if node['corosync']['key_file']
    cookbook_file 'corosync-authkey' do
      owner     'root'
      group     'root'
      mode      0400
      sensitive true
      source    node['corosync']['key_file']
      action    :create
    end
  else
    execute 'Create authkeys file' do
      command 'corosync-keygen -l'
      sensitive true
      creates '/etc/corosync/authkey'
    end
  end

  # Fix hosts file
  hostsfile_entry '127.0.0.1' do
    hostname 'localhost'
    aliases ['localhost.localdomain']
    comment 'Update by Chef'
    action :update
  end

  # Add all the nodes that we have to the hosts file
  node['corosync']['config']['node_list'].each do |n|
    hostsfile_entry n['ip_addr'] do
      hostname n['node_name']
      comment 'Update by Chef'
      action :create_if_missing
    end
  end

  # Create a service, will be started upon the config file creation
  service 'corosync' do
    supports restart: true, status: true
    action :enable
  end

  # Create a conf file
  template "#{node['corosync']['conf_dir']}/corosync.conf" do
    cookbook 'corosync'
    source 'corosync.conf.erb'
    mode '644'
    owner 'root'
    group 'root'
    notifies :restart, 'service[corosync]'
    variables corosync: new_resource
  end
end
