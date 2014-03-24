maintainer       'Cybera'
maintainer_email 'devops@cybera.ca'
license          'All rights reserved'
name             'cybera_logstash'
description      'Installs/Configures logstash for Cybera'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.8.1'

recipe "default",         ""

depends "apt"
depends "logrotate"
