name "logstash_indexer"
description "Installs a logstash indexer that will take in events from various sources, filter/modify them, and send them off to some number of outputs"
run_list ["recipe[cybera_logstash]"]