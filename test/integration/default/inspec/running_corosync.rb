describe user('hacluster') do
  it { should exist }
end

describe file('/etc/corosync') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'hacluster' }
  its('mode') { should cmp '0755' }
end
describe file('/var/log/cluster/') do
  it { should exist }
  it { should be_directory }
end

describe file('/etc/corosync/corosync.conf') do
  it { should exist }
  it { should be_file }
  it { should be_readable }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0644' }
  its('content') { should include 'interface' }
end

describe service('corosync') do
  it { should be_running }
  it { should be_enabled }
end
