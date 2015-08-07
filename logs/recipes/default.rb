package 'awslogs' do
  action :install
end

template '/etc/awslogs/awscli.conf' do
  cookbook 'logs'
  source 'awscli.conf.erb'
  owner 'root'
  group 'root'
  mode 0600
end

template '/etc/awslogs/awslogs.conf' do
  cookbook 'logs'
  source 'awslogs.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[awslogs]', :delayed
end


service 'awslogs' do
  supports [:start, :stop, :status, :restart]
  action [:enable, :start]
end
