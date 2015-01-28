#
# Cookbook Name:: cloudwatch_logs
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



# install.rb
 
directory "/opt/aws/cloudwatch" do
  recursive true
end

template "/opt/aws/cloudwatch/cwlogs.cfg" do
  cookbook "cloudwatch_logs"
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end

remote_file "/opt/aws/cloudwatch/awslogs-agent-setup.py" do
  source "https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py"
  mode "0755"
end
 
execute "Install CloudWatch Logs agent" do
  command "/opt/aws/cloudwatch/awslogs-agent-setup.py -n -r us-west-2 -c /opt/aws/cloudwatch/cwlogs.cfg"
  not_if { system "pgrep -f aws-logs-agent-setup" }
end