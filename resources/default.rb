#
# Cookbook Name:: corosync
# Provider:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#
resource_name :corosync

default_action :create

# Corosync.conf directives
state_attrs :totem_version

# Totem properties
property :totem_version, [Integer, nil], default: node['corosync']['config']['totem']['version']
property :totem_crypto_cipher, equal_to: [:none, 'none', \
                                          :aes256, 'aes256', \
                                          :aes192, 'aes192', \
                                          :aes128, 'aes128', \
                                          :des, '3des'], default: node['corosync']['config']['totem']['crypto_cipher']
property :totem_crypto_hash, equal_to: [:none, 'none', \
                                        :md5, 'md5', \
                                        :sha1, 'sha1', \
                                        :sha256, 'sha256', \
                                        :sha384, 'sha384', \
                                        :sha512, 'sha512'], default: node['corosync']['config']['totem']['crypto_hash']
property :totem_secauth, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['totem']['secauth']
property :totem_transport, equal_to: [:udp, 'udp', :udpu, 'udpu', :iba, 'iba'], default: node['corosync']['config']['totem']['transport']
property :totem_rrp_mode, equal_to: [:none, 'none', :active, 'active', :passive, 'passive'], default: node['corosync']['config']['totem']['rrp_mode']
property :totem_netmtu,   [Integer, nil], default: node['corosync']['config']['totem']['netmtu']
property :totem_cluster_name, [String, nil], default: node['corosync']['config']['totem']['cluster_name']
property :totem_config_version, [Integer, nil], default: node['corosync']['config']['totem']['config_version']
property :totem_ip_version, equal_to: [:ipv4, 'ipv4', :ipv6, 'ipv6'], default: node['corosync']['config']['totem']['ip_version']
property :totem_token, [Integer, nil], default: node['corosync']['config']['totem']['token']
property :totem_token_coefficient, [Integer, nil], default: node['corosync']['config']['totem']['token_coefficient']
property :totem_token_retransmit, [Integer, nil], default: node['corosync']['config']['totem']['token_retransmit']
property :totem_hold, [Integer, nil], default: node['corosync']['config']['totem']['hold']
property :totem_token_retransmits_before_loss_const, [Integer, nil], default: node['corosync']['config']['totem']['token_retransmits_before_loss_const']
property :totem_join, [Integer, nil], default: node['corosync']['config']['totem']['join']
property :totem_send_join,   [Integer, nil], default: node['corosync']['config']['totem']['send_join']
property :totem_consensus,   [Integer, nil], default: node['corosync']['config']['totem']['consensus']
property :totem_merge, [Integer, nil], default: node['corosync']['config']['totem']['merge']
property :totem_downcheck, [Integer, nil], default: node['corosync']['config']['totem']['downcheck']
property :totem_fail_recv_const, [Integer, nil], default: node['corosync']['config']['totem']['fail_recv_const']
property :totem_seqno_unchanged_const, [Integer, nil], default: node['corosync']['config']['totem']['seqno_unchanged_const']
property :totem_heartbeat_failures_allowed, [Integer, nil], default: node['corosync']['config']['totem']['heartbeat_failures_allowed']
property :totem_max_network_delay, [Integer, nil], default: node['corosync']['config']['totem']['max_network_delay']
property :totem_window_size, [Integer, nil], default: node['corosync']['config']['totem']['window_size']
property :totem_max_messages, [Integer, nil], default: node['corosync']['config']['totem']['max_messages']
property :totem_miss_count_const, [Integer, nil], default: node['corosync']['config']['totem']['miss_count_const']
property :totem_rrp_problem_count_timeout, [Integer, nil], default: node['corosync']['config']['totem']['rrp_problem_count_timeout']
property :totem_rrp_problem_count_threshold, [Integer, nil], default: node['corosync']['config']['totem']['rrp_problem_count_threshold']
property :totem_rrp_problem_count_mcast_threshold, [Integer, nil], default: node['corosync']['config']['totem']['rrp_problem_count_mcast_threshold']
property :totem_rrp_token_expired_timeout, [Integer, nil], default: node['corosync']['config']['totem']['rrp_token_expired_timeout']
property :totem_rrp_autorecovery_check_timeout, [Integer, nil], default: node['corosync']['config']['totem']['rrp_autorecovery_check_timeout']

# Totem interface
property :totem_interface_ringnumber, [Integer, nil], default: node['corosync']['config']['totem']['interface']['ringnumber']
property :totem_interface_bindnetaddr, [String, nil], default: node['corosync']['config']['totem']['interface']['bindnetaddr']
property :totem_interface_broadcast, equal_to: [:on, 'yes', :off, 'no'], default: node['corosync']['config']['totem']['interface']['broadcast']
property :totem_interface_mcastaddr,   [String, nil], default: node['corosync']['config']['totem']['interface']['mcastaddr']
property :totem_interface_mcastport,   [Integer, nil], default: node['corosync']['config']['totem']['interface']['mcastport']
property :totem_interface_ttl, [Integer, nil], default: node['corosync']['config']['totem']['interface']['ttl']

# Logging properties
property :log_fileline, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['fileline']
property :log_timestamp, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['timestamp']
property :log_function_name, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['function_name']
property :log_to_logfile, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['to_logfile']
property :log_to_syslog, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['to_syslog']
property :log_to_stderr, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['to_stderr']
property :log_logfile,   [String, nil], default: node['corosync']['config']['logging']['logfile']
property :log_debug, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['debug']
property :log_logfile_priority, equal_to: [:alert, 'alert', \
                                           :crit, 'crit', \
                                           :debug, 'debig', \
                                           :emerg, 'emerg', \
                                           :err, 'err', \
                                           :info, 'info', \
                                           :notice, 'notice', \
                                           :warning, 'warning'], default: node['corosync']['config']['logging']['logfile_priority']
property :log_syslog_facility, equal_to: [:daemon, 'daemon', \
                                          :local0, 'local0', \
                                          :local1, 'local1', \
                                          :local2, 'local2', \
                                          :local3, 'local3', \
                                          :local4, 'local4', \
                                          :local5, 'local5', \
                                          :local6, 'local6', \
                                          :local7, 'local7'], default: node['corosync']['config']['logging']['syslog_facility']
property :log_syslog_priority, equal_to: [:alert, 'alert', \
                                          :crit, 'crit', \
                                          :debug, 'debig', \
                                          :emerg, 'emerg', \
                                          :err, 'err', \
                                          :info, 'info', \
                                          :notice, 'notice', \
                                          :warning, 'warning'], default: node['corosync']['config']['logging']['syslog_priority']
property :log_logger_subsys,   [String, nil], default: node['corosync']['config']['logging']['logger_subsys']['subsys']
property :log_logger_subsys_debug, equal_to: [:on, 'on', :off, 'off'], default: node['corosync']['config']['logging']['logger_subsys']['debug']

# Node list properties
property :node_list # Expect the following structure: [{'ring: Int', 'node_name: String', 'ip_addr: String'}]

# Quorum properties
property :quorum_provider,   [String, nil], default: node['corosync']['config']['quorum']['provider']
property :quorum_expected_votes, [Integer, nil], default: node['corosync']['config']['quorum']['expected_votes']
property :quorum_two_node, [Integer, nil], default: node['corosync']['config']['quorum']['two_node']
property :quorum_wait_for_all, [Integer, nil], default: node['corosync']['config']['quorum']['wait_for_all']
property :quorum_last_man_standing, [Integer, nil], default: node['corosync']['config']['quorum']['last_man_standing']
property :quorum_last_man_standing_window, [Integer, nil], default: node['corosync']['config']['quorum']['last_man_standing_window']
property :quorum_expected_votes, [Integer, nil], default: node['corosync']['config']['quorum']['expected_votes']
property :quorum_auto_tie_breaker, [Integer, nil], default: node['corosync']['config']['quorum']['auto_tie_breaker']
property :quorum_auto_tie_breaker_node, [String, nil], default: node['corosync']['config']['quorum']['auto_tie_breaker_node']
property :quorum_allow_downscale, [Integer, nil], default: node['corosync']['config']['quorum']['allow_downscale']
property :quorum_expected_votes_tracking, [Integer, nil], default: node['corosync']['config']['quorum']['expected_votes_tracking']

property :vault, [String, nil]

action :create do
  # Create cluster user
  poise_service_user 'hacluster' do
    group 'haclient'
  end

  # Create config directory
  directory node['corosync']['conf_dir'] do
    owner 'hacluster'
    mode '0755'
    action :create
  end

  directory ::File.dirname(new_resource.log_logfile) do
    recursive true
  end

  # Copy or create the key file
  if node['corosync']['key_file']
    cookbook_file "#{node['corosync']['conf_dir']}/authkey" do
      owner     'hacluster'
      group     'root'
      mode      0400
      sensitive true
      source    node['corosync']['key_file']
      action    :create
    end
  elsif node['corosync']['vault']
    # todo download authkey to every machine
  else
    execute 'Create authkeys file' do
      command 'corosync-keygen -l'
      sensitive true
      creates "#{node['corosync']['conf_dir']}/authkey"
    end
  end

  # Fix hosts file
  hostsfile_entry '127.0.0.1' do
    hostname 'localhost'
    aliases ['localhost.localdomain']
    comment 'Update by Chef'
    action :update
  end

  hostsfile_entry '127.0.1.1' do
    hostname 'localhost'
    aliases ['localhost.localdomain']
    comment 'Update by Chef'
    action :update
  end

  # Add all the nodes that we have to the hosts file
  new_resource.node_list.each do |n|
    hostsfile_entry n['ip_addr'] do
      hostname n['node_name']
      comment 'Update by Chef'
      action :create_if_missing
    end
  end

  # Set config dir ownership to this user
  execute 'Set corosync confdir owner' do
    command "chown hacluster #{node['corosync']['conf_dir']} -R"
  end

  # Create a conf file
  template "#{node['corosync']['conf_dir']}/corosync.conf" do
    cookbook 'corosync-cookbook'
    source 'corosync.conf.erb'
    mode '644'
    owner 'root'
    group 'root'
    variables corosync: new_resource
    notifies :run, 'execute[Test corosync configuration]', :immediately
  end

  execute 'Test corosync configuration' do
    command 'corosync -t'
    notifies :restart, 'service[corosync]', :immediately
    action :nothing
  end
  # Create a service, will be started upon the config file creation

  service 'corosync' do
    supports status: true, restart: true
    action :enable
  end
end
