name             'test'
maintainer       'Simão Silva'
maintainer_email 'simao.silva@tecnico.ulisboa.pt'
license          'All rights reserved'
description      'For testing corosync-cookbook'
long_description 'For testing corosync-cookbook'
license 'GPL-3.0-only'
version          '0.2.0'
chef_version '>= 12.19'

depends          'corosync-cookbook'

source_url 'https://github.com/ist-dsi/corosync-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/ist-dsi/corosync-cookbook/issues' if respond_to?(:issues_url)

%w( redhat centos ).each do |el|
  supports el, '>= 7.0'
end

%w( 16.04 18.04 ).each do |ver|
  supports 'ubuntu', ">=#{ver}"
end

supports 'debian', '>= 9.0'
