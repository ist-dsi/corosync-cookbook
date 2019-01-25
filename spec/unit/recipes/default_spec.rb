#
# Cookbook Name:: corosync
# Spec:: default
#
# Copyright (c) 2016 Petr Belyaev <upcfrost@gmail.com>

require 'spec_helper'

describe 'corosync::default' do
  platforms = {
    'debian' => '9.6',
    'centos' => '7.6.1804',
    'ubuntu' => '18.04',
  }
  platforms.each do |platform, _value|
    context 'When using default recipe on debian' do
      let(:chef_run) { ChefSpec::ServerRunner.new(platform, version).converge(described_recipe) }

      it 'installs package "corosync"' do
        expect(chef_run).to install_package('corosync')
      end
    end
  end
end
