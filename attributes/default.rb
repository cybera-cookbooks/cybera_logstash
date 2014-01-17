# General logstash settings
default[:logstash][:ssl][:enabled] = true
default[:logstash][:ssl][:path] = "/etc/logstash/ssl"
default[:logstash][:group] = "adm"

# ElasticSearch attributes
default[:elasticsearch][:path][:conf] = "/etc/elasticsearch"
default[:elasticsearch][:path][:logs] = "/var/log/elasticsearch"
default[:elasticsearch][:path][:logs] = "/var/lib/elasticsearch/data"
default[:elasticsearch][:path][:data] = "/elasticsearch"
default[:elasticsearch][:nginx][:allow_cluster_api] = true
default[:elasticsearch][:nginx][:passwords_file] = "#{node[:elasticsearch][:path][:conf]}/passwords"



# RabbitMQ attributes (only needed if using RabbitMQ as the broker)
default[:rabbitmq][:default_user] = "logstashuser"
default[:rabbitmq][:default_pass] = "logstashSuP3Rs3creT"
default[:rabbitmq][:enabled_users] =
  [
    {
      :name => node[:rabbitmq][:default_user],
      :password => node[:rabbitmq][:default_pass],
      :rights => [{:vhost => nil , :conf => ".*", :write => ".*", :read => ".*"}]
    }
  ]

default[:rabbitmq][:ssl_port] = 5671
default[:rabbitmq][:ssl] = node[:logstash][:ssl][:enabled],
default[:rabbitmq][:ssl_cacert] = "#{node[:logstash][:ssl][:path]}/cacert.pem"
default[:rabbitmq][:ssl_cert] = "#{node[:logstash][:ssl][:path]}/cert.pem"
default[:rabbitmq][:ssl_key] = "#{node[:logstash][:ssl][:path]}/key.pem"
default[:rabbitmq][:ssl_verify] = "verify_none"


# The following settings are specific to logstash agents (shippers)
default[:logstash][:agent][:server_role] = "logstash_indexer"
default[:logstash][:agent][:source_url] = "https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar"
default[:logstash][:agent][:version] = "1.2.2"
default[:logstash][:agent][:base_config] = "lmc_shipper.conf.erb"
default[:logstash][:agent][:base_config_cookbook] = "cybera_logstash"
default[:logstash][:agent][:input_template_partials] = [
  "apache.erb",
  "php5_fpm.erb",
  "postgresql.erb",
  "syslog.erb"
]
default[:logstash][:agent][:filter_template_partials] = [
]
default[:logstash][:agent][:output_template_partials] = [
  "rabbitmq.erb"
]

# The following settings are specific to logstash brokers
default[:logstash][:broker][:type] = "rabbitmq"
default[:logstash][:broker][:ipaddress] = "127.0.0.1"
default[:logstash][:broker][:port] = node[:rabbitmq][:ssl_port]

# The following settings are specific to logstash servers (indexers)
default[:logstash][:server][:base_config] = "lmc_indexer.conf.erb"
default[:logstash][:server][:base_config_cookbook] = "cybera_logstash"
default[:logstash][:server][:enable_embedded_es] = false
default[:logstash][:server][:install_rabbitmq] = false
default[:logstash][:server][:source_url] = "https://download.elasticsearch.org/logstash/logstash/logstash-1.2.2-flatjar.jar"
default[:logstash][:server][:version] = "1.2.2"
default[:logstash][:server][:input_template_partials] = [
  "rabbitmq.erb"
]
default[:logstash][:server][:filter_template_partials] = [
  "apache.erb",
  "php5_fpm.erb",
  "postgres.erb",
  "syslog.erb"
]
default[:logstash][:server][:output_template_partials] = [
  "elasticsearch.erb"
]

# Custom Patterns here
# NOTE: be careful about escape sequences here, don't let it waste hours of your time!
default[:logstash][:patterns] = {
  apache: {
    APACHE_LMC_ACCESS_LOG: "%{IPORHOST:clientip} %{USER:ident} %{USER:auth} \\[%{HTTPDATE:timestamp}\\] \"(?:%{WORD:verb} %{NOTSPACE:request}(?: HTTP/%{NUMBER:httpversion})?|%{DATA:rawrequest})\" %{NUMBER:response} (?:%{NUMBER:bytes}|-) (?:%{NUMBER:responsetime}|-) %{QS:referrer} %{QS:agent}",
    APACHE_ERROR_LOG: "\\[%{DAY}\\s+(?<timestamp>%{SYSLOGTIMESTAMP}\\s+%{YEAR})\\]\\s+\\[%{DATA:severity}\\]\\s+\\[%{WORD}\\s+%{IP:clientip}\\]\\s+%{GREEDYDATA:errmsg}"
  },
  php5_fpm: {
    PHP5_FPM_LOG: '\[(?<timestamp>%{MONTHDAY}-%{MONTH}-%{YEAR} %{TIME})\] %{WORD:severity}:'
  }
}

