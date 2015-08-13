
default['newrelic']['server_monitoring']['hostname'] = [
  node['opsworks']['stack']['name'],
  node['opsworks']['instance']['hostname'],
  node['opsworks']['instance']['aws_instance_id']
].join('_')
