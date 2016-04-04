#
# Cookbook Name:: corosync
# Resource:: corosync_default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#

default_action :create

# Corosync.conf directives
state_attrs :totem_version

# Totem attributes
attribute :totem_version, kind_of: Integer
attribute :totem_crypto_cipher, equal_to: [:none, 'none', \
                                           :aes256, 'aes256', \
                                           :aes192, 'aes192', \
                                           :aes128, 'aes128', \
                                           :des, '3des']
attribute :totem_crypto_hash, equal_to: [:none, 'none', \
                                         :md5, 'md5', \
                                         :sha1, 'sha1', \
                                         :sha256, 'sha256', \
                                         :sha384, 'sha384', \
                                         :sha512, 'sha512']
attribute :totem_secauth, equal_to: [:on, 'on', :off, 'off']
attribute :totem_transport, equal_to: [:udp, 'udp', :udpu, 'udpu', :iba, 'iba']
attribute :totem_rrp_mode, equal_to: [:none, 'none', :active, 'active', :passive, 'passive']
attribute :totem_netmtu, kind_of: Integer
attribute :totem_cluster_name, kind_of: String
attribute :totem_config_version, kind_of: Integer
attribute :totem_ip_version, equal_to: [:ipv4, 'ipv4', :ipv6, 'ipv6']
attribute :totem_token, kind_of: Integer
attribute :totem_token_coefficient, kind_of: Integer
attribute :totem_token_retransmit, kind_of: Integer
attribute :totem_hold, kind_of: Integer
attribute :totem_token_retransmits_before_loss_const, kind_of: Integer
attribute :totem_join, kind_of: Integer
attribute :totem_send_join, kind_of: Integer
attribute :totem_consensus, kind_of: Integer
attribute :totem_merge, kind_of: Integer
attribute :totem_downcheck, kind_of: Integer
attribute :totem_fail_recv_const, kind_of: Integer
attribute :totem_seqno_unchanged_const, kind_of: Integer
attribute :totem_heartbeat_failures_allowed, kind_of: Integer
attribute :totem_max_network_delay, kind_of: Integer
attribute :totem_window_size, kind_of: Integer
attribute :totem_max_messages, kind_of: Integer
attribute :totem_miss_count_const, kind_of: Integer
attribute :totem_rrp_problem_count_timeout, kind_of: Integer
attribute :totem_rrp_problem_count_threshold, kind_of: Integer
attribute :totem_rrp_problem_count_mcast_threshold, kind_of: Integer
attribute :totem_rrp_token_expired_timeout, kind_of: Integer
attribute :totem_rrp_autorecovery_check_timeout, kind_of: Integer

# Totem interface
attribute :totem_interface_ringnumber, kind_of: Integer
attribute :totem_interface_bindnetaddr, kind_of: String
attribute :totem_interface_broadcast, equal_to: [:on, 'yes', :off, 'no']
attribute :totem_interface_mcastaddr, kind_of: String
attribute :totem_interface_mcastport, kind_of: Integer
attribute :totem_interface_ttl, kind_of: Integer

# Logging attributes
attribute :log_fileline, equal_to: [:on, 'on', :off, 'off']
attribute :log_timestamp, equal_to: [:on, 'on', :off, 'off']
attribute :log_function_name, equal_to: [:on, 'on', :off, 'off']
attribute :log_to_logfile, equal_to: [:on, 'on', :off, 'off']
attribute :log_to_syslog, equal_to: [:on, 'on', :off, 'off']
attribute :log_to_stderr, equal_to: [:on, 'on', :off, 'off']
attribute :log_logfile, kind_of: String
attribute :log_debug, equal_to: [:on, 'on', :off, 'off']
attribute :log_logfile_priority, equal_to: [:alert, 'alert', \
                                            :crit, 'crit', \
                                            :debug, 'debig', \
                                            :emerg, 'emerg', \
                                            :err, 'err', \
                                            :info, 'info', \
                                            :notice, 'notice', \
                                            :warning, 'warning']
attribute :log_syslog_facility, equal_to: [:daemon, 'daemon', \
                                           :local0, 'local0', \
                                           :local1, 'local1', \
                                           :local2, 'local2', \
                                           :local3, 'local3', \
                                           :local4, 'local4', \
                                           :local5, 'local5', \
                                           :local6, 'local6', \
                                           :local7, 'local7']
attribute :log_syslog_priority, equal_to: [:alert, 'alert', \
                                           :crit, 'crit', \
                                           :debug, 'debig', \
                                           :emerg, 'emerg', \
                                           :err, 'err', \
                                           :info, 'info', \
                                           :notice, 'notice', \
                                           :warning, 'warning']
attribute :log_logger_subsys, kind_of: String
attribute :log_logger_subsys_debug, equal_to: [:on, 'on', :off, 'off']

# Node list attributes
attribute :node_list # Expect the following structure: [{'ring: Int', 'node_name: String', 'ip_addr: String'}]

# Quorum attributes
attribute :quorum_provider, kind_of: String
attribute :quorum_expected_votes, kind_of: Integer
attribute :quorum_two_node, kind_of: Integer
attribute :quorum_wait_for_all, kind_of: Integer
attribute :quorum_last_man_standing, kind_of: Integer
attribute :quorum_last_man_standing_window, kind_of: Integer
attribute :quorum_expected_votes, kind_of: Integer
attribute :quorum_auto_tie_breaker, kind_of: Integer
attribute :quorum_auto_tie_breaker_node, kind_of: String
attribute :quorum_allow_downscale, kind_of: Integer
attribute :quorum_expected_votes_tracking, kind_of: Integer
