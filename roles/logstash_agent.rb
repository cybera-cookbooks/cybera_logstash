name "logstash_agent"
description "Installs a logstash agent that will ship logs to some number of different sources (such as a logstash indexer)"
run_list ["recipe[cybera_logstash::agent]"]