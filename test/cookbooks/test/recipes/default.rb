corosync 'config' do
  totem_cluster_name 'test-cluster'
  totem_secauth 'off'
  totem_transport 'udpu'
  totem_interface_bindnetaddr node['ipaddress']
  node_list [{ 'ring' => 0, 'node_name' => node['hostname'], 'ip_addr' => node['ipaddress'] }]
  quorum_provider 'corosync_votequorum'
  quorum_two_node 1
  action :create
end
