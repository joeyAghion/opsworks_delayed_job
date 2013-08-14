# Adapted from nginx::stop: https://github.com/aws/opsworks-cookbooks/blob/master/nginx/recipes/stop.rb

include_recipe "opsworks_delayed_job::service"

node[:deploy].each do |application, deploy|
  
  service "delayed_job_#{application}" do
    action :stop
  end
  
end
