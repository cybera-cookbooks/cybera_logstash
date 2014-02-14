# should add support for YUM based distros
apt_repository "logstash" do
  uri "http://packages.elasticsearch.org/logstash/1.3/debian"
  distribution "stable"
  components ["main"]
  key "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
  action :add
end
include_recipe "apt"

package "logstash"
service "logstash" do
  supports restart: true, start: true, stop: true, status: true
end

# this is used by init for logstash
template "/etc/default/logstash" do
  source "etc/default/logstash.erb"
  notifies :restart, "service[logstash]"
  action :create
end

logrotate_app 'logstash' do
  cookbook  'logrotate'
  path      "#{node[:logstash][:log_directory]}/logstash.log"
  frequency 'daily'
  create    '644 root adm'
  rotate    7
end

template "#{node[:logstash][:config_directory]}/logstash.conf" do
  source "config/logstash.conf.erb"
  variables({
    patterns_dir: node[:logstash][:patterns_directory],
    inputs: node[:logstash][:config][:inputs] || {},
    filters: node[:logstash][:config][:filters] || {},
    outputs: node[:logstash][:config][:outputs] || {}
  })
  notifies :restart, "service[logstash]"
  action :create
end