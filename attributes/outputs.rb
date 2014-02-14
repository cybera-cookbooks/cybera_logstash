outputs_path = "config/outputs"
default[:logstash][:config][:outputs][:elasticsearch][:enabled] = true
default[:logstash][:config][:outputs][:elasticsearch][:template_path] = "#{outputs_path}/elasticsearch.erb"
default[:logstash][:config][:outputs][:elasticsearch][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:outputs][:elasticsearch][:variables][:host] = "localhost"
