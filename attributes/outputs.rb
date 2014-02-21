outputs_path = "config/outputs"
default[:logstash][:config][:outputs][:elasticsearch][:enabled] = true
default[:logstash][:config][:outputs][:elasticsearch][:template_path] = "#{outputs_path}/elasticsearch.erb"
default[:logstash][:config][:outputs][:elasticsearch][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:outputs][:elasticsearch][:variables][:host] = "localhost"

default[:logstash][:config][:outputs][:rabbitmq][:enabled] = false
default[:logstash][:config][:outputs][:rabbitmq][:template_path] = "#{outputs_path}/rabbitmq.erb"
default[:logstash][:config][:outputs][:rabbitmq][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:outputs][:rabbitmq][:variables][:host] = "localhost"
default[:logstash][:config][:outputs][:rabbitmq][:variables][:port] = 5671
default[:logstash][:config][:outputs][:rabbitmq][:variables][:user] = "logstashuser"
default[:logstash][:config][:outputs][:rabbitmq][:variables][:password] = "logstashSuP3Rs3creT"
default[:logstash][:config][:outputs][:rabbitmq][:variables][:ssl_enabled] = false

default[:logstash][:config][:outputs][:stdout][:variables][:debug] = false
default[:logstash][:config][:outputs][:stdout][:variables][:codec] = "plain"
default[:logstash][:config][:outputs][:stdout][:variables][:workers] = 1
