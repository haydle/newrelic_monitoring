#
# Cookbook Name:: newrelic_monitoring
# Attributes:: default
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

default['newrelic']['license_key'] = "MUST_SET_THIS"

default['newrelic']['config_dir'] = config_dir = "/etc/newrelic"
default['newrelic']['config_file'] = "#{config_dir}/nrsysmond.cfg"

# default['newrelic']['data_bag'] = nil
# default['newrelic']['data_bag_item'] = nil
