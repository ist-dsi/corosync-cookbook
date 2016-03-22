#
# Cookbook Name:: corosync
# Provider:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#

action :create do
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
