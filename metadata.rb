name             "newrelic_monitoring"
maintainer       "Justin Reagor"
maintainer_email "justin+gh@haydle.com"
license          "Apache 2.0"
description      "Installs/configures New Relic system monitoring"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "2.0.0"

recipe "newrelic_monitoring", "Installs/configures New Relic system monitoring service"

%w{ubuntu debian redhat fedora centos}.each do |os|
  supports os
end

depends "apt"
