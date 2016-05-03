#
# Cookbook Name:: corosync
# Spec:: default
#
# Copyright (c) 2016 Petr Belyaev <upcfrost@gmail.com>

require 'spec_helper'

describe 'corosync::default' do
  context 'When using default recipe' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'installs package "corosync"' do
      expect(chef_run).to install_package('corosync')
    end
  end
end
