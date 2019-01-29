#
# Cookbook Name:: corosync
# Spec:: default
#
# Copyright (c) 2016 Petr Belyaev <upcfrost@gmail.com>

require 'spec_helper'

describe 'corosync-cookbook::default' do
  context 'When using default recipe' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'debian').converge(described_recipe) }

    it 'installs packages ' do
      expect(chef_run).to install_package(%w(corosync pcs))
    end
  end
end
