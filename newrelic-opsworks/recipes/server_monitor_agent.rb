# Service created by included recipe
service node['newrelic']['server_monitor_agent']['service_name'] do
  supports [:start, :stop, :status, :restart, :reload]
  action :nothing
end

include_recipe 'newrelic::server_monitor_agent'

group 'docker' do
  append true
  members ['newrelic']
  action :manage
  notifies :restart, "service[#{node['newrelic']['server_monitor_agent']['service_name']}]", :delayed
end
