name 'corosync-cookbook'
# estamos em processo de querido mudei a casa
maintainer 'Simão Silva'
maintainer_email 'simao.silva@tecnico.ulisboa.p'
license 'GPL-3.0-only'

description 'Installs/Configures Corosync'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.1'

chef_version '>= 12.19'

source_url 'https://github.com/ist-dsi/corosync-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/ist-dsi/corosync-cookbook/issues' if respond_to?(:issues_url)

%w( apt yum yum-epel poise-service hostsfile selinux).each do |dep|
  depends dep
end

%w( redhat centos ).each do |el|
  supports el, '>= 7.0'
end

%w( 16.04 18.04 ).each do |ver|
  supports 'ubuntu', ">=#{ver}"
end

supports 'debian', '>= 9.0'
