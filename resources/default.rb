#
# Cookbook Name:: corosync
# Resource:: corosync_config
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#

default_action :create

# Corosync.conf directives
state_attrs :totem_version

# Totem attributes
attribute :totem_version, kind_of: Integer, default: 2
attribute :totem_crypto_cipher, equal_to: [:none, 'none', \
                                   :aes256, 'aes256', \
								   :aes192, 'aes192', \
								   :aes128, 'aes128', \
								   :des, '3des'], default: :aes256
attribute :totem_crypto_hash, equal_to: [:none, 'none', \
			                       :md5, 'md5', \
			                       :sha1, 'sha1', \
								   :sha256, 'sha256', \
								   :sha384, 'sha384', \
                                   :sha512, 'sha512'], default: :sha1
attribute :totem_secauth, equal_to: [:on, 'on', :off, 'off'], default: :on
attribute :totem_transport, equal_to: [:udp, 'udp', :udpu, 'udpu', :iba, 'iba'], default: :udp
attribute :totem_rrp_mode, equal_to: [:none, 'none', :active, 'active', :passive, 'passive'], default: :none
attribute :totem_netmtu, kind_of: Integer, default: 1500
attribute :totem_cluster_name, kind_of: String
attribute :totem_config_version, kind_of: Integer, default: 0
attribute :totem_ip_version, equal_to: [:ipv4, 'ipv4', :ipv6, 'ipv6'], default: :ipv4
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
attribute :totem_interface_ringnumber, kind_of: Integer, default: 0
attribute :totem_interface_bindnetaddr, kind_of: String
attribute :totem_interface_broadcast, equal_to: [:on, 'yes', :off, 'no']
attribute :totem_interface_mcastaddr, kind_of: String
attribute :totem_interface_mcastport, kind_of: Integer
attribute :totem_interface_ttl, kind_of: Integer, default: 1

# Logging attributes
attribute :log_fileline, equal_to: [:on, 'on', :off, 'off'], default: :off
attribute :log_timestamp, equal_to: [:on, 'on', :off, 'off'], default: :on
attribute :log_function_name, equal_to: [:on, 'on', :off, 'off'], default: :off
attribute :log_to_logfile, equal_to: [:on, 'on', :off, 'off'], default: :on
attribute :log_to_syslog, equal_to: [:on, 'on', :off, 'off'], default: :on
attribute :log_to_stderr, equal_to: [:on, 'on', :off, 'off'], default: :off
attribute :log_logfile, kind_of: String, default: "/var/log/cluster/corosync.log"
attribute :log_debug, equal_to: [:on, 'on', :off, 'off'], default: :off
attribute :log_logfile_priority, equal_to: [:alert, 'alert', \
                                            :crit, 'crit', \
				    						:debug, 'debig', \
			    							:emerg, 'emerg', \
		    								:err, 'err', \
	    									:info, 'info', \
    										:notice, 'notice', \
								    		:warning, 'warning'], default: :info
attribute :log_syslog_facility, equal_to: [:daemon, 'daemon', \
                            	           :local0, 'local0', \
										   :local1, 'local1', \
										   :local2, 'local2', \
										   :local3, 'local3', \
										   :local4, 'local4', \
										   :local5, 'local5', \
										   :local6, 'local6', \
										   :local7, 'local7'], default: :daemon
attribute :log_syslog_priority, equal_to: [:alert, 'alert', \
                                           :crit, 'crit', \
					    				   :debug, 'debig', \
				    					   :emerg, 'emerg', \
			    						   :err, 'err', \
										   :info, 'info', \
										   :notice, 'notice', \
										   :warning, 'warning'], default: :info
attribute :log_logger_subsys, kind_of: String, default: "QUORUM"
attribute :log_logger_subsys_debug, equal_to: [:on, 'on', :off, 'off'], default: :off

# Node list attributes
attribute :nodes # Expect the following structure: [{'ring: Int', 'node_name: String', 'ip_addr: String'}]
attribute :node_ring_num, kind_of: Integer, default: 0
attribute :node_ring_addr, kind_of: String
attribute :node_nodeid, kind_of: Integer
attribute :node_ipc_type, equal_to: [:native, 'native', :shm, 'shm', :socker, 'socker']

# Quorum attributes
attribute :quorum_provider, kind_of: String, default: "corosync_votequorum"
attribute :quorum_expected_votes, kind_of: Integer
attribute :quorum_two_node, kind_of: Integer
attribute :quorum_wait_for_all, kind_of: Integer
attribute :quorum_last_man_standing, kind_of: Integer
attribute :quorum_expected_votes, kind_of: Integer
attribute :quorum_auto_tie_breaker, kind_of: Integer
attribute :quorum_auto_tie_breaker_node, kind_of: String
attribute :quorum_allow_downscale, kind_of: Integer
attribute :quorum_expected_votes_tracking, kind_of: Integer
