include_recipe "java"

# should add support for YUM based distros
logstash_version = node[:logstash][:version]
apt_repository "logstash" do
  uri "http://packages.elastic.co/logstash/#{logstash_version}/debian"
  distribution "stable"
  components ["main"]
  key "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
  action :add
end
include_recipe "apt"

package "logstash"
service "logstash" do
  action :enable
  supports restart: true, start: true, stop: true, status: true
end

# this is used by init for logstash
#cookbook_file "/etc/init.d/logstash" do
#  source "logstash"
#  mode 0755
#  notifies :restart, "service[logstash]"
#  action :create
#end
#template "/etc/default/logstash" do
#  source "etc/default/logstash.erb"
#  mode 0755
#  notifies :restart, "service[logstash]"
#  action :create
#end

logrotate_app 'logstash' do
  cookbook  'logrotate'
  path      "#{node[:logstash][:log_directory]}/logstash.log"
  frequency 'daily'
  create    '644 root adm'
  rotate    7
end

group "adm" do
  action :modify
  members node[:logstash][:user]
  append true
end

directory node[:logstash][:patterns_directory] do
  owner "root"
  group "root"
  mode 0755
end

node[:logstash][:patterns].each do |pattern_group, patterns|
  lines = []
  patterns.each do |pattern_name, pattern_content|
    lines << "#{pattern_name} #{pattern_content}"
  end
  file "#{node[:logstash][:patterns_directory]}/#{pattern_group}" do
    content "#{lines.join("\n")}\n"
    owner "root"
    group "root"
    mode 0644
  end
end

template "#{node[:logstash][:config_directory]}/logstash.conf" do
  source "config/logstash.conf.erb"
  mode 0644
  variables({
    patterns_dir: node[:logstash][:patterns_directory],
    inputs: node[:logstash][:config][:inputs] || {},
    filters: node[:logstash][:config][:filters] || {},
    outputs: node[:logstash][:config][:outputs] || {}
  })
  notifies :restart, "service[logstash]"
  action :create
end
