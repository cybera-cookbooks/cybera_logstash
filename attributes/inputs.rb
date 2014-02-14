inputs_path = "config/inputs"
default[:logstash][:config][:inputs][:rabbitmq][:enabled] = false
default[:logstash][:config][:inputs][:rabbitmq][:template_path] = "#{inputs_path}/rabbitmq.erb"
default[:logstash][:config][:inputs][:rabbitmq][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:host] = "localhost"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:port] = 9000
default[:logstash][:config][:inputs][:rabbitmq][:variables]