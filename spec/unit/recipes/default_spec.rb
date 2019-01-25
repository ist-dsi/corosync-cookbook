#
# Cookbook Name:: corosync
# Spec:: default
#
# Copyright (c) 2016 Petr Belyaev <upcfrost@gmail.com>

require 'spec_helper'

describe 'corosync::default' do
  context 'When using default recipe on debian' do
    let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'debian', version: '9.6').converge(described_recipe) }

    it 'installs package "corosync"' do
      expect(chef_run).to install_package('corosync')
    end
  end
  context 'When using default recipe on centos' do
    let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '7.6.1804').converge(described_recipe) }

    it 'installs package "corosync"' do
      expect(chef_run).to install_package('corosync')
    end
  end
end
