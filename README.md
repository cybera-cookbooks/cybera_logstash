DESCRIPTION
===========

FILES
=====
If using SSL for the server recipe, it is expected that you're SSL cert is in the location set in the following attributes:
* default[:rabbitmq][:ssl_cacert] = "#{node[:logstash][:ssl][:path]}/cacert.pem"
* default[:rabbitmq][:ssl_cert] = "#{node[:logstash][:ssl][:path]}/cert.pem"
* default[:rabbitmq][:ssl_key] = "#{node[:logstash][:ssl][:path]}/key.pem"
* default[:logstash][:ssl][:path] = "/etc/logstash/ssl"
Of course you can override these if you like

