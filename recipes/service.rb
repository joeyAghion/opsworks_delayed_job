service "monit" do
  supports :status => false, :restart => true, :reload => true
  action :nothing
end


node[:deploy].each do |application, deploy|
  
  service "delayed_job_#{application}" do
    restart_command node[:delayed_job][application][:restart_command]
    stop_command "sudo monit stop -g delayed_job_#{application}_group"
    
    status_command "exit 0"  # bug in redhat provider insists on executing the status command even when unavailable
    supports :restart => true, :stop => true, :status => false
    
    action :nothing
  end
  
  # Overwrite the unicorn restart command declared elsewhere
  # Apologies for the `sleep`, but monit errors with "Other action already in progress" on some boots.
  execute "restart Rails app #{application}" do
    command "sleep 300 && #{node[:delayed_job][application][:restart_command]}"
    action :nothing
  end
  
end
