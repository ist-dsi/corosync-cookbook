corosync Cookbook
=================

Installs corosync, and includes templates for the configuration management.

Requirements
------------
#### Platforms
- Debian/Ubuntu
- RHEL/CentOS

#### Chef
- Chef 11+

#### Cookbooks
- none

Recipes
-------

###default

Installs the corosync, and manages the corosync service. 
The recipe does not at this time manage any configuration.

###config

Sample configuration recipe for corosync using 
`node['corosync']['config']` attributes.

Usage
-----
Use the `default` recipe to install corosync's packages and manage
the service.
