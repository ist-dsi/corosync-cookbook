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


corosync 'config' do
  # Totem attributes
  totem_version       node['corosync']['config']['totem']['version']
  totem_crypto_cipher node['corosync']['config']['totem']['crypto_cipher']
  totem_crypto_hash   node['corosync']['config']['totem']['crypto_hash']
  totem_secauth       node['corosync']['config']['totem']['secauth']
  totem_transport     node['corosync']['config']['totem']['transport']
  totem_rrp_mode      node['corosync']['config']['totem']['rrp_mode']
  totem_netmtu        node['corosync']['config']['totem']['netmtu']
  totem_cluster_name  node['corosync']['config']['totem']['cluster_name']
  totem_config_version    node['corosync']['config']['totem']['config_version']
  totem_ip_version    node['corosync']['config']['totem']['ip_version']
  totem_token         node['corosync']['config']['totem']['token']
  totem_token_coefficient node['corosync']['config']['totem']['token_coefficient']
  totem_token_retransmit  node['corosync']['config']['totem']['token_retransmit']
  totem_hold          node['corosync']['config']['totem']['hold']
  totem_token_retransmits_before_loss_const node['corosync']['config']['totem']['token_retransmits_before_loss_const']
  totem_join          node['corosync']['config']['totem']['join']
  totem_send_join     node['corosync']['config']['totem']['send_join']
  totem_consensus     node['corosync']['config']['totem']['consensus']
  totem_merge         node['corosync']['config']['totem']['merge']
  totem_downcheck     node['corosync']['config']['totem']['downcheck']
  totem_fail_recv_const   node['corosync']['config']['totem']['fail_recv_const']
  totem_seqno_unchanged_const node['corosync']['config']['totem']['seqno_unchanged_const']
  totem_heartbeat_failures_allowed node['corosync']['config']['totem']['heartbeat_failures_allowed']
  totem_max_network_delay node['corosync']['config']['totem']['max_network_delay']
  totem_window_size   node['corosync']['config']['totem']['window_size']
  totem_max_messages  node['corosync']['config']['totem']['max_messages']
  totem_miss_count_const  node['corosync']['config']['totem']['miss_count_const']
  totem_rrp_problem_count_timeout node['corosync']['config']['totem']['rrp_problem_count_timeout']
  totem_rrp_problem_count_threshold node['corosync']['config']['totem']['rrp_problem_count_threshold']
  totem_rrp_problem_count_mcast_threshold node['corosync']['config']['totem']['rrp_problem_count_mcast_threshold']
  totem_rrp_token_expired_timeout node['corosync']['config']['totem']['rrp_token_expired_timeout']
  totem_rrp_autorecovery_check_timeout node['corosync']['config']['totem']['rrp_autorecovery_check_timeout']
  # Totem interface attributes
  totem_interface_ringnumber  node['corosync']['config']['totem']['interface']['ringnumber']
  totem_interface_bindnetaddr node['corosync']['config']['totem']['interface']['bindnetaddr']
  totem_interface_broadcast   node['corosync']['config']['totem']['interface']['broadcast']
  totem_interface_mcastaddr   node['corosync']['config']['totem']['interface']['mcastaddr']
  totem_interface_mcastport   node['corosync']['config']['totem']['interface']['mcastport']
  totem_interface_ttl         node['corosync']['config']['totem']['interface']['ttl']
  
  # Logging attributes
  log_fileline node['corosync']['config']['logging']['fileline']
  log_timestamp node['corosync']['config']['logging']['timestamp']
  log_function_name node['corosync']['config']['logging']['function_name']
  log_to_logfile node['corosync']['config']['logging']['to_logfile']
  log_to_syslog node['corosync']['config']['logging']['to_syslog']
  log_to_stderr node['corosync']['config']['logging']['to_stderr']
  log_logfile node['corosync']['config']['logging']['logfile']
  log_logfile_priority node['corosync']['config']['logging']['logfile_priority']
  log_syslog_facility node['corosync']['config']['logging']['syslog_facility']
  log_syslog_priority node['corosync']['config']['logging']['syslog_priority']
  log_debug node['corosync']['config']['logging']['debug']
  log_logger_subsys node['corosync']['config']['logging']['logger_subsys']['subsys']
  log_logger_subsys_debug node['corosync']['config']['logging']['logger_subsys']['debug']
  
  # Node list
  node_list node['corosync']['config']['node_list']
  
  # Quorum attributes
  quorum_provider node['corosync']['config']['quorum']['provider']
  quorum_expected_votes node['corosync']['config']['quorum']['expected_votes']
  quorum_two_node node['corosync']['config']['quorum']['two_node']
  quorum_wait_for_all node['corosync']['config']['quorum']['wait_for_all']
  quorum_last_man_standing node['corosync']['config']['quorum']['last_man_standing']
  quorum_last_man_standing_window node['corosync']['config']['quorum']['last_man_standing_window']
  quorum_auto_tie_breaker node['corosync']['config']['quorum']['auto_tie_breaker']
  quorum_auto_tie_breaker_node node['corosync']['config']['quorum']['auto_tie_breaker_node']
  quorum_allow_downscale node['corosync']['config']['quorum']['allow_downscale']
  quorum_expected_votes_tracking node['corosync']['config']['quorum']['expected_votes_tracking']
end

service 'corosync' do
  supports restart: true, status: true
  action [:enable, :start]
end