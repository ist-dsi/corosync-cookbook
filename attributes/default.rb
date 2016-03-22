#
# Cookbook Name:: corosync
# Attributes:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>

default['corosync']['conf_dir'] = '/etc/corosync'

# Totem attributes
default['corosync']['config']['totem']['version'] = nil
default['corosync']['config']['totem']['crypto_cipher'] = nil
default['corosync']['config']['totem']['crypto_hash'] = nil
default['corosync']['config']['totem']['secauth'] = nil
default['corosync']['config']['totem']['transport'] = nil
default['corosync']['config']['totem']['rrp_mode'] = nil
default['corosync']['config']['totem']['netmtu'] = nil
default['corosync']['config']['totem']['cluster_name'] = nil
default['corosync']['config']['totem']['config_version'] = nil
default['corosync']['config']['totem']['ip_version'] = nil
default['corosync']['config']['totem']['token'] = nil
default['corosync']['config']['totem']['token_coefficient'] = nil
default['corosync']['config']['totem']['token_retransmit'] = nil
default['corosync']['config']['totem']['hold'] = nil
default['corosync']['config']['totem']['token_retransmits_before_loss_const'] = nil
default['corosync']['config']['totem']['join'] = nil
default['corosync']['config']['totem']['send_join'] = nil
default['corosync']['config']['totem']['consensus'] = nil
default['corosync']['config']['totem']['merge'] = nil
default['corosync']['config']['totem']['downcheck'] = nil
default['corosync']['config']['totem']['fail_recv_const'] = nil
default['corosync']['config']['totem']['seqno_unchanged_const'] = nil
default['corosync']['config']['totem']['heartbeat_failures_allowed'] = nil
default['corosync']['config']['totem']['max_network_delay'] = nil
default['corosync']['config']['totem']['window_size'] = nil
default['corosync']['config']['totem']['max_messages'] = nil
default['corosync']['config']['totem']['miss_count_const'] = nil
default['corosync']['config']['totem']['rrp_problem_count_timeout'] = nil
default['corosync']['config']['totem']['rrp_problem_count_threshold'] = nil
default['corosync']['config']['totem']['rrp_problem_count_mcast_threshold'] = nil
default['corosync']['config']['totem']['rrp_token_expired_timeout'] = nil
default['corosync']['config']['totem']['rrp_autorecovery_check_timeout'] = nil
# Totem interface attributes
default['corosync']['config']['totem']['interface']['ringnumber'] = nil
default['corosync']['config']['totem']['interface']['bindnetaddr'] = nil
default['corosync']['config']['totem']['interface']['broadcast'] = nil
default['corosync']['config']['totem']['interface']['mcastaddr'] = nil
default['corosync']['config']['totem']['interface']['mcastport'] = nil
default['corosync']['config']['totem']['interface']['ttl'] = nil

# Logging attributes
default['corosync']['config']['logging']['fileline'] = nil
default['corosync']['config']['logging']['timestamp'] = nil
default['corosync']['config']['logging']['function_name'] = nil
default['corosync']['config']['logging']['to_logfile'] = nil
default['corosync']['config']['logging']['to_syslog'] = nil
default['corosync']['config']['logging']['to_stderr'] = nil
default['corosync']['config']['logging']['logfile'] = nil
default['corosync']['config']['logging']['logfile_priority'] = nil
default['corosync']['config']['logging']['syslog_facility'] = nil
default['corosync']['config']['logging']['syslog_priority'] = nil
default['corosync']['config']['logging']['debug'] = nil
default['corosync']['config']['logging']['logger_subsys']['subsys'] = nil
default['corosync']['config']['logging']['logger_subsys']['debug'] = nil

# Node list attributes
default['corosync']['config']['nodelist']['node']['ring_num'] = nil
default['corosync']['config']['nodelist']['node']['ring_addr'] = nil
default['corosync']['config']['nodelist']['node']['nodeid'] = nil
default['corosync']['config']['nodelist']['node']['ipc_type'] = nil

# Quorum attributes
default['corosync']['config']['quorum']['provider'] = nil
default['corosync']['config']['quorum']['expected_votes'] = nil
default['corosync']['config']['quorum']['two_node'] = nil
default['corosync']['config']['quorum']['wait_for_all'] = nil
default['corosync']['config']['quorum']['last_man_standing'] = nil
default['corosync']['config']['quorum']['last_man_standing_window'] = nil
default['corosync']['config']['quorum']['auto_tie_breaker'] = nil
default['corosync']['config']['quorum']['auto_tie_breaker_node'] = nil
default['corosync']['config']['quorum']['allow_downscale'] = nil
default['corosync']['config']['quorum']['expected_votes_tracking'] = nil
