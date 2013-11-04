default[:logstash][:agent][:server_role] = "logstash_indexer"
default[:logstash][:agent][:source_url] = "https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar"
default[:logstash][:agent][:version] = "1.2.2"
default[:logstash][:server][:base_config] = "lmc_indexer.conf.erb"
default[:logstash][:server][:base_config_cookbook] = "cybera_logstash"
default[:logstash][:server][:enable_embedded_es] = false
default[:logstash][:server][:install_rabbitmq] = false
default[:logstash][:server][:source_url] = "https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar"
default[:logstash][:server][:version] = "1.2.2"
# default[:logstash][:server][:patterns_dir] = "/opt/logstash/server/etc/patterns/"
default[:logstash][:patterns] = {
  apache: {
    APACHE_LMC_ACCESS_LOG: "%{IPORHOST:clientip} %{USER:ident} %{USER:auth} \\[%{HTTPDATE:timestamp}\\] \"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\" %{NUMBER:response} (?:%{NUMBER:bytes}|-) (?:%{NUMBER:responsetime}|-) %{QS:referrer} %{QS:agent}"
  }
}
default[:logstash][:ssl][:enabled] = true
default[:logstash][:ssl][:path] = "/etc/logstash/ssl"

default[:elasticsearch][:path][:conf] = "/etc/elasticsearch"
default[:elasticsearch][:path][:logs] = "/var/log/elasticsearch"
default[:elasticsearch][:path][:logs] = "/var/lib/elasticsearch/data"


default[:rabbitmq][:default_user] = "logstashuser"
default[:rabbitmq][:default_pass] = "logstashSuP3Rs3creT"
default[:rabbitmq][:ssl_port] = 5671

default[:rabbitmq][:ssl] = node[:logstash][:ssl][:enabled],
default[:rabbitmq][:ssl_cacert] = "#{node[:logstash][:ssl][:path]}/cacert.pem"
default[:rabbitmq][:ssl_cert] = "#{node[:logstash][:ssl][:path]}/cert.pem"
default[:rabbitmq][:ssl_key] = "#{node[:logstash][:ssl][:path]}/key.pem"
default[:rabbitmq][:ssl_verify] = "verify_none"
