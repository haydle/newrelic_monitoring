#
# Cookbook Name:: newrelic_monitoring
# Recipe:: default
#
# Copyright 2011, 8thBridge, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

monitor_cfg = node['newrelic']['monitor_cfg']
dbag_name   = node['newrelic']['data_bag']['name']
dbag_item   = node['newrelic']['data_bag']['item']
dbag_key    = node['newrelic']['data_bag']['key']

license_key = if dbag_name
  Chef::EncryptedDataBagItem.load(dbag_name, dbag_item)[dbag_key]
else
  node['newrelic']['license_key']
end

case node['platform']
when 'ubuntu', 'debian'
  apt_repository 'newrelic' do
    uri 'https://apt.newrelic.com/debian/'
    components ['newrelic', 'non-free']
  end

  package "newrelic-sysmond" do
    action :upgrade
    options "--allow-unauthenticated"
  end
when "redhat", "centos", "fedora"
  repo_rpm = "http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm"

  remote_file "#{Chef::Config[:file_cache_path]}/#{repo_rpm}" do
    source "http://download.newrelic.com/pub/newrelic/el5/i386/#{repo_rpm}"
    mode 0644
  end

  package "newrelic-repo" do
    source "#{Chef::Config[:file_cache_path]}/#{repo_rpm}"
    action :install
    provider Chef::Provider::Package::Rpm
  end

  package "newrelic-sysmond" do
    action :upgrade
  end
end

execute "nrsysmond-config" do
  command "nrsysmond-config --set license_key=#{license_key}"
  action :run

  only_if do
    !::File.exists?(monitor_cfg) ||
      ::File.readlines(monitor_cfg).grep(/#{license_key}/).empty?
  end
end

service "newrelic-sysmond" do
  supports :restart => true, :status => true
  action [:enable, :start]
end
