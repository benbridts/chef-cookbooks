
if node['nginx']['log_dir']

  # error.log
  log_group_name = "#{node['cwlogs_ow']['base_name']}/nginx/error.log"
  node.default['cwlogs']['logfiles'][log_group_name] = {
    :log_stream_name => '{instance_id}-{hostname}',
    :log_group_name => log_group_name,
    :file => "#{node['nginx']['log_dir']}/error.log",
    :datetime_format => '[%Y/%m/%d %H:%M:%S]',
  }

  # access.log
  log_group_name = "#{node['cwlogs_ow']['base_name']}/nginx/access.log"
  node.default['cwlogs']['logfiles'][log_group_name] = {
    :log_stream_name => '{instance_id}-{hostname}',
    :log_group_name => log_group_name,
    :file => "#{node['nginx']['log_dir']}/access.log",
    :datetime_format => '[%d/%b/%Y:%H:%M:%S %z]',
  }

  # application.access.log
  node['opsworks']['applications'].each do |app|
    log_group_name = "#{node['cwlogs_ow']['base_name']}/nginx/#{app['name']}/access.log"
    node.default['cwlogs']['logfiles'][log_group_name] = {
      :log_stream_name => '{instance_id}-{hostname}',
      :log_group_name => log_group_name,
      :file => "#{node['nginx']['log_dir']}/#{app['name'].gsub('-', '_')}.access.log",
      :datetime_format => '[%d/%b/%Y:%H:%M:%S %z]',
    }
  end
end
