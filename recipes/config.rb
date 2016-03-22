#
# Cookbook Name:: corosync
# Recipe:: config_example
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#

directory node['corosync']['conf_dir'] do
  owner "root"
  mode "0755"
  action :create
end

# FIXME: warning, using insecure key generation method
execute 'Create authkeys file' do
  command 'corosync-keygen -l'
  sensitive true
  creates '/etc/corosync/authkey'
end

service 'corosync' do
  supports restart: true, status: true
  action [:enable, :start]
end