# need to drop off SSL certs to ... some location (for rabbitmq)

## these should be set in role or something
class Chef::Recipe
  include Logstash::Keychain
end

include_recipe "rabbitmq"
rabbitmq_user node[:rabbitmq][:default_user] do
  password node[:rabbitmq][:default_pass]
  action :add
end
rabbitmq_user node[:rabbitmq][:default_user] do
  permissions ".* .* .*"
  action :set_permissions
end

include_recipe "elasticsearch"
include_recipe "elasticsearch::proxy"
include_recipe "kibana"
include_recipe "logstash::server"

if node[:logstash] && node[:logstash][:ssl] && node[:logstash][:ssl][:enabled]
  install_dir = node[:logstash][:ssl][:path]
  directory install_dir do
    owner "root"
    group "root"
    mode 0755
    action :create
    recursive true
  end
  key_content = ""
  cert_content = ""
  cacert_content = ""
  if Chef::Config[:solo]
    cookbook_file "#{install_dir}/cert.pem" do
      source "cert.pem"
      mode 0644
      owner "root"
      group "root"
    end
    cookbook_file "#{install_dir}/cacert.pem" do
      source "cacert.pem"
      mode 0644
      owner "root"
      group "root"
    end
    cookbook_file "#{install_dir}/key.pem" do
      source "key.pem"
      mode 0644
      owner "root"
      group "root"
    end

    # cert = data_bag_item("ssl", "certs")
    # key_content = cert['key']
    # cert_content = cert['cert']
    # cacert_content = cert['cacert']
  else
    key_content = keychain_key_by_name("logstash-ssl-key")
    cert_content = keychain_key_by_name("logstash-ssl-cert")
    cacert_content = keychain_key_by_name("logstash-ssl-cacert")
    file "#{install_dir}/key.pem" do
      content key_content
      owner "root"
      group "root"
      mode "0666"
      action :create
    end
    file "#{install_dir}/cert.pem" do
      content cert_content
      owner "root"
      group "root"
      mode "0666"
      action :create
    end
    file "#{install_dir}/cacert.pem" do
      content cacert_content
      owner "root"
      group "root"
      mode "0666"
      action :create
    end
  end
end
