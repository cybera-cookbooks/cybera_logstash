# General logstash settings
default[:logstash][:user]  = "logstash"
default[:logstash][:group] = "logstash"
default[:logstash][:log_directory] = "/var/log/logstash"
default[:logstash][:config_directory] = "/etc/logstash/conf.d"
# plugin directory is not currently being used...
default[:logstash][:plugin_directory] = "#{node[:logstash][:install_directory]}/plugins"
default[:logstash][:patterns_directory] = "/etc/grok_patterns"

# Command line options for logstash
# This section of attributes should probably provide the minimum reasonable default and either give suggestions
# for different settings for common usage scenarios... or perhaps better, link to relivant Logstash documentation
default[:logstash][:xms] = "1024M"      # not used right now
default[:logstash][:xmx] = "1024M"
default[:logstash][:java_options] = ""  # not used right now
default[:logstash][:gc_options] = "-XX:+UseParallelOldGC"  # not used right now
default[:logstash][:filter_workers] = 1  # not used right now

# Custom Patterns here
# NOTE: be careful about escape sequences here, don't let it waste hours of your time!
default[:logstash][:patterns] = {
  apache: {
    APACHE_LMC_ACCESS_LOG: '%{COMMONAPACHELOG} (?:%{NUMBER:response_time}|-) %{QS:referrer} %{QS:agent}',
    APACHE_ERROR_LOG: "\\[%{DAY}\\s+(?<timestamp>%{SYSLOGTIMESTAMP}\\s+%{YEAR})\\]\\s+\\[%{DATA:severity}\\]\\s+\\[%{WORD}\\s+%{IP:clientip}\\]\\s+%{GREEDYDATA:errmsg}"
  },
  php5_fpm: {
    PHP5_FPM_LOG: '\[(?<timestamp>%{MONTHDAY}-%{MONTH}-%{YEAR} %{TIME})\] %{WORD:severity}:'
  },
  moodle_cron: {
    MOODLE_CRON_TIMESTAMP: '%{YEAR}-%{MONTHNUM}-%{MONTHDAY}[T ]%{HOUR}:?%{MINUTE}(?::?%{SECOND})',
    MOODLE_CRON_MD5SUM: '\([a-zA-Z0-9]+\)',
    HYPHEN: '\-'
  }
}
