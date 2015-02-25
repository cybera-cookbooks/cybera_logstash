maintainer       'Cybera'
maintainer_email 'devops@cybera.ca'
license          'All rights reserved'
name             'cybera_logstash'
description      'Installs/Configures logstash for Cybera'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.10.1' # Sprint 2014/08 (patched)

recipe "default",         ""

depends "apt"
depends "logrotate"
