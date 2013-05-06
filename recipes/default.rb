#
# Cookbook Name:: logwatch
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
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

include_recipe "perl"

package "logwatch"

# configure logwatch email daily report
template "/etc/logwatch/conf/logwatch.conf" do
  source "logwatch.conf.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  variables(
    :logwatch_email => node['logwatch']['email'],
    :logwatch_detail => node['logwatch']['detail'],
    :logwatch_range => node['logwatch']['range'],
    :logwatch_output => node['logwatch']['output'],
    :logwatch_format => node['logwatch']['format']
  )
end
