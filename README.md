# newrelic_monitoring

## Description

Install New Relic's system monitoring agent using Chef.

Tested on Ubuntu (fork untested on Debian, Red Hat, CentOS, or Fedora).

## Requirements

Ubuntu/Debian: Uses `apt` cookbook which has a dependency on Chef 11.

## Attributes

Either set license_key yourself or setup a data bag with the license inside it's
data bag item.

  * `node['newrelic']['license_key']` - Your New Relic license key.
  * `node['newrelic']['data_bag']` - Data bag that has data bag item inside (optional; need to set both).
  * `node['newrelic']['data_bag_item']` - Data bag item that contains license_key.

See default attributes for other optional settings.

## Usage

Run `bundle install` to contribute, update, and test the cookbook.

You'll need to perform one of the following in order to set your license key
provided by New Relic.

  1. Tell the cookbook which data bag to look in for the "license_key" by setting the data_bag attributes.
  1. Set the attribute `node['newrelic']['license_key']`.
  1. Create an encrypted or plain text data bag called 'tokens/newrelic_license'.

    {
      "id": "newrelic",
      "license_key": "a1b2c3d4f5e3f1b1"
    }

Include `recipe[newrelic_monitoring]` in a run list to have the system monitored
with defaults. This performs a baseline installation (must set license_key).

## References

  * [New Relic home page](http://newrelic.com/)
  * [Monitoring Announcement](http://blog.newrelic.com/2011/11/08/server-monitoring-is-here/)
  * [Gist](https://gist.github.com/1348720) by Eron Nicholson with earlier work

## Development

In order to contribute to this cookbook you'll need to perform the following.

    bundle install

## License

### Maintainer

Justin Reagor (@cheapRoc), for [Haydle.com]()

### Author

Author: Ry4an Brase (<ry4an-opscode@ry4an.org>)
Copyright 2011, 8thBridge, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
A copy of the license is contained within the file LICENSE.
You may obtain a copy of the License at...

  [http://www.apache.org/licenses/LICENSE-2.0]()

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
