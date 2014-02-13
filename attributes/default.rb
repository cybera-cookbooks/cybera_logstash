# General logstash settings
default[:logstash][:user]  = "logstash"
default[:logstash][:group] = "logstash"
default[:logstash][:log_directory] = "/var/log/logstash"
default[:logstash][:config_directory] = "/etc/logstash/conf.d"
# plugin directory is not currently being used...
default[:logstash][:plugin_directory] = "#{node[:logstash][:install_directory]}/plugins"
default[:logstash][:patterns_directory] = "#{node[:logstash][:config_directory]}/patterns"

# Command line options for logstash
# This section of attributes should probably provide the minimum reasonable default and either give suggestions
# for different settings for common usage scenarios... or perhaps better, link to relivant Logstash documentation
default[:logstash][:xms] = "1024M"      # not used right now
default[:logstash][:xmx] = "1024M"
default[:logstash][:java_options] = ""  # not used right now
default[:logstash][:gc_options] = "-XX:+UseParallelOldGC"  # not used right now
default[:logstash][:filter_workers] = 1  # not used right now


# The following settings are specific to logstash brokers
# this should really be removed as a broker is not 'really' part of Logstash, it is more to be defined as
# an input and output. Theoretically a person could use more than one, so this attribute doesn't really make sense.
default[:logstash][:broker][:type] = "none"
default[:logstash][:broker][:ipaddress] = "127.0.0.1"
default[:logstash][:broker][:port] = 9000

# The following settings are specific to logstash servers (indexers)
default[:logstash][:config][:input_template_partials] = [
#  "rabbitmq.erb"
]
default[:logstash][:config][:filter_template_partials] = [
  "apache.erb",
  "php5_fpm.erb",
  "postgres.erb",
  "syslog.erb"
]
default[:logstash][:config][:output_template_partials] = [
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

