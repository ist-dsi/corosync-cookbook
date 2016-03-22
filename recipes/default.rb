#
# Cookbook Name:: corosync
# Recipe:: default
#
# Copyright (c) 2016 Petr Belyaev <upcfrost@gmail.com>, All Rights Reserved.
#

package 'corosync'

service 'corosync' do
  supports(
    restart: true,
    status: true
  )
  action :enable
end
