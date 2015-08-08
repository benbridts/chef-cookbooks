default[:cwlogs][:region] = node[:opsworks][:instance][:region]
default[:cwlogs_ow][:base_name] = "/ow/#{node[:opsworks][:stack][:name]}"

# shorter variable names
ow_instance = node[:opsworks][:instance]
log_stream_name = "#{ow_instance[:aws_instance_id]}-#{ow_instance[:hostname]}"

# Opsworks logs
log_group_name = "#{default[:cwlogs_ow][:base_name]}/ow/agent.log"
default["cwlogs"]["logfiles"][log_group_name] = {
    :log_stream_name => log_stream_name,
    :log_group_name => log_group_name,
    :file => '/var/log/aws/opsworks/opsworks-agent.log',
    :datetime_format => "[%Y-%m-%d %H:%M:%S]",
}

log_group_name = "#{default[:cwlogs_ow][:base_name]}/ow/installer.log"
default["cwlogs"]["logfiles"][log_group_name] = {
    :log_stream_name => log_stream_name,
    :log_group_name => log_group_name,
    :file => '/var/log/aws/opsworks/opsworks-agent.log',
    :datetime_format => "[%Y-%m-%d %H:%M:%S]",
}
