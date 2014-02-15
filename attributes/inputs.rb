inputs_path = "config/inputs"
default[:logstash][:config][:inputs][:rabbitmq][:enabled] = false
default[:logstash][:config][:inputs][:rabbitmq][:template_path] = "#{inputs_path}/rabbitmq.erb"
default[:logstash][:config][:inputs][:rabbitmq][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:host] = "localhost"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:port] = 5671
default[:logstash][:config][:inputs][:rabbitmq][:variables][:user] = "logstashuser"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:password] = "logstashSuP3Rs3creT"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:ssl_enabled] = false

default[:logstash][:config][:inputs][:syslog][:enabled] = false
default[:logstash][:config][:inputs][:syslog][:template_path] = "#{inputs_path}/syslog.erb"
default[:logstash][:config][:inputs][:syslog][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:rabbitmq][:variables] = {}
