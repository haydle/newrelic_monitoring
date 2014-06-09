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

# Configuration location, etc.
default['newrelic']['monitor_dir'] = monitor_dir = "/etc/newrelic"
default['newrelic']['monitor_file'] = monitor_file = "nrsysmond.cfg"
default['newrelic']['monitor_cfg'] = File.join(monitor_dir, monitor_file)

# Encrypted data bag support by setting at least newrelic.data_bag.name
default['newrelic']['data_bag'] = {
                                   # 'name' => 'MUST_SET_IF_USING_DATA_BAG',
                                   'item' => 'newrelic_license',
                                   'key' => 'token'
                                  }

# If 'newrelic.data_bag.name' does not exist, we use this
default['newrelic']['license_key'] = "MUST_SET_THIS"
