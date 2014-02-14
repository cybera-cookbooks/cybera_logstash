filters_path = "config/filters"
default[:logstash][:config][:filters][:apache][:enabled] = false
default[:logstash][:config][:filters][:apache][:template_path] = "#{filters_path}/apache.erb"
default[:logstash][:config][:filters][:apache][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:filters][:apache][:variables] = {}

default[:logstash][:config][:filters][:php5_fpm][:enabled] = false
default[:logstash][:config][:filters][:php5_fpm][:template_path] = "#{filters_path}/php5_fpm.erb"
default[:logstash][:config][:filters][:php5_fpm][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:filters][:php5_fpm][:variables] = {}

default[:logstash][:config][:filters][:postgresql][:enabled] = false
default[:logstash][:config][:filters][:postgresql][:template_path] = "#{filters_path}/postgres.erb"
default[:logstash][:config][:filters][:postgresql][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:filters][:postgresql][:variables] = {}

default[:logstash][:config][:filters][:syslog][:enabled] = false
default[:logstash][:config][:filters][:syslog][:template_path] = "#{filters_path}/syslog.erb"
default[:logstash][:config][:filters][:syslog][:template_cookbook] = "cybera_logstash"
default[:logstash][:config][:filters][:syslog][:variables] = {}
