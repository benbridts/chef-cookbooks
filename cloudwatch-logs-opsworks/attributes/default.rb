default[:cwlogs][:region] = node[:opsworks][:instance][:region]
default[:cwlogs_ow][:base_name] = "/ow/#{node[:opsworks][:stack][:name]}"

# Opsworks logs
log_group_name = "#{default[:cwlogs_ow][:base_name]}/ow/agent.log"
default["cwlogs"]["logfiles"][log_group_name] = {
    :log_stream_name => '{instance_id}-{hostname}',
    :log_group_name => log_group_name,
    :file => '/var/log/aws/opsworks/opsworks-agent.log',
    :datetime_format => "[%Y-%m-%d %H:%M:%S]",
}

log_group_name = "#{default[:cwlogs_ow][:base_name]}/ow/installer.log"
default["cwlogs"]["logfiles"][log_group_name] = {
    :log_stream_name => '{instance_id}-{hostname}',
    :log_group_name => log_group_name,
    :file => '/var/log/aws/opsworks/installer.log',
    :datetime_format => "[%Y-%m-%d %H:%M:%S]",
    :multi_line_start_pattern = '{datetime_format}'
}
