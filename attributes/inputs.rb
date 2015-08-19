inputs_path = "config/inputs"
default[:logstash][:config][:inputs][:rabbitmq][:enabled] = false
default[:logstash][:config][:inputs][:rabbitmq][:template_path] = "#{inputs_path}/rabbitmq.erb"
default[:logstash][:config][:inputs][:rabbitmq][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:host] = "localhost"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:port] = 5671
default[:logstash][:config][:inputs][:rabbitmq][:variables][:user] = "logstashuser"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:password] = "logstashSuP3Rs3creT"
default[:logstash][:config][:inputs][:rabbitmq][:variables][:ssl_enabled] = false
default[:logstash][:config][:inputs][:rabbitmq][:variables][:threads] = 1

# FILE INPUTS
## TODO: These file inputs can likely just be replaced by a more generic file template
default[:logstash][:config][:inputs][:apache][:enabled] = false
default[:logstash][:config][:inputs][:apache][:template_path] = "#{inputs_path}/apache.erb"
default[:logstash][:config][:inputs][:apache][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:apache][:variables] = {}

default[:logstash][:config][:inputs][:haproxy][:enabled] = false
default[:logstash][:config][:inputs][:haproxy][:template_path] = "#{inputs_path}/haproxy.erb"
default[:logstash][:config][:inputs][:haproxy][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:haproxy][:variables] = {}

default[:logstash][:config][:inputs][:moodle_cron][:enabled] = false
default[:logstash][:config][:inputs][:moodle_cron][:template_path] = "#{inputs_path}/moodle_cron.erb"
default[:logstash][:config][:inputs][:moodle_cron][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:moodle_cron][:variables] = {}

default[:logstash][:config][:inputs][:php5_fpm][:enabled] = false
default[:logstash][:config][:inputs][:php5_fpm][:template_path] = "#{inputs_path}/php5_fpm.erb"
default[:logstash][:config][:inputs][:php5_fpm][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:php5_fpm][:variables] = {}

default[:logstash][:config][:inputs][:php5_fpm_access][:enabled] = false
default[:logstash][:config][:inputs][:php5_fpm_access][:template_path] = "#{inputs_path}/php5_fpm_access.erb"
default[:logstash][:config][:inputs][:php5_fpm_access][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:php5_fpm_access][:variables] = {}

default[:logstash][:config][:inputs][:postgresql][:enabled] = false
default[:logstash][:config][:inputs][:postgresql][:template_path] = "#{inputs_path}/postgresql.erb"
default[:logstash][:config][:inputs][:postgresql][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:postgresql][:variables] = {}

default[:logstash][:config][:inputs][:syslog][:enabled] = false
default[:logstash][:config][:inputs][:syslog][:template_path] = "#{inputs_path}/syslog.erb"
default[:logstash][:config][:inputs][:syslog][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:inputs][:syslog][:variables] = {}
