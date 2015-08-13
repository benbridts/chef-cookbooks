include_recipe 'newrelic::server_monitor_agent'

group 'docker' do
  append true
  members ['newrelic']
  action :manage
end
