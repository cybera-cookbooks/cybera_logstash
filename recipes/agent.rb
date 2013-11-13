include_recipe "logstash::agent"

# Strangely the logstash recipe removes the 'ubuntu' user from the 'adm' group when 
# it is set to use the group as the primary group for the logstash user. So here we 
# re-add the ubuntu user
group "adm" do
  members "ubuntu"
  action :modify
  append true
end
