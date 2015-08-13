# Include stack and instance id in newrelic hostname
default['newrelic']['server_monitoring']['hostname'] = [
  node['opsworks']['stack']['name'],
  node['opsworks']['instance']['hostname'],
  node['opsworks']['instance']['aws_instance_id']
].join('_')

# Set service name so we can trigger a restart
default['newrelic']['server_monitor_agent']['service_name'] = 'newrelic-sysmond'
