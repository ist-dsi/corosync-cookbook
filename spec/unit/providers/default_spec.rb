#
# Cookbook Name:: corosync
# Spec:: default
#
# Copyright (c) 2016 Petr Belyaev <upcfrost@gmail.com>

require 'spec_helper'

describe 'test::corosync_default' do
  context 'Using the default options' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(step_into: 'corosync').converge(described_recipe)
    end

    it 'should create user hacluster' do
      expect(chef_run).to create_poise_service_user('hacluster')
    end

    it 'should generate keyfile by itself' do
      expect(chef_run).to run_execute('Create authkeys file')
    end

    it 'should fix the hostsfile' do
      expect(chef_run).to update_hostsfile_entry('127.0.0.1')
    end

    it 'should set the correct confdir owner' do
      expect(chef_run).to run_execute('Set corosync confdir owner')
    end

    it 'should enable corosync service' do
      expect(chef_run).to enable_poise_service('corosync')
    end
  end

  context 'Given key file' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(step_into: 'corosync') do |node|
        node.set['corosync']['key_file'] = 'authkey'
      end.converge(described_recipe)
    end

    it 'should copy the file to the config dir' do
      expect(chef_run).to create_cookbook_file('/etc/corosync/authkey')
    end
  end
end
