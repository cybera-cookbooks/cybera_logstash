# should add support for YUM based distros
apt_repository "logstash" do
  uri "http://packages.elasticsearch.org/logstash/1.3/debian"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
  action :add
end
include_recipe "apt"

package "logstash"
service "logstash" do
  supports restart: true
end

# this is used by init for logstash
template "/etc/default/logstash" do
  source "etc/default/logstash.erb"
  notifies :restart, "logstash"
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
    patterns_dir: node[:logstash][:patterns_directory]
  })
  notifies :restart, "logstash"
  action :create
end