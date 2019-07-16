#
# Cookbook:: couchbase
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

remote_file "/tmp/couchbase-release-1.0-5-x86_64.rpm" do
  source "http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-5-x86_64.rpm"
  not_if "rpm -qa | grep -1 '^couchbase-release-'"
  action :create
end

yum_package "couchbase-release" do
  source "/tmp/couchbase-release-1.0-5-x86_64.rpm"
  action :install
end

package "couchbase-server-community" do
  action :install
end

service "couchbase-server" do
  action [:enable, :start]
  supports :status => true, :restart => true
end
