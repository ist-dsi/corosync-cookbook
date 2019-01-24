name 'corosync'
# estamos em processo de querido mudei a casa
maintainer 'Petr Belyaev'
maintainer_email 'upcfrost@gmail.com'
license 'GPL-3.0-only'
description 'Installs/Configures Corosync'
long_description 'Installs/Configures Corosync'
version '0.1.1'

chef_version '>= 12.19'

source_url 'https://github.com/upcFrost/chef_corosync_cookbook'
issues_url 'https://github.com/upcFrost/chef_corosync_cookbook/issues'

depends 'hostsfile'
depends 'poise-service'
depends 'yum'
depends 'apt'

supports 'centos', '>= 7.0'
supports 'ubuntu', '>= 14.04'
supports 'debian', '>= 9.0'
