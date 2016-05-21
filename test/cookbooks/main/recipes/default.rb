docker_installation_package 'default' do
  only_if { node['instance_role'] == 'util' && node['name'] == 'docker' }
end

docker_service_manager 'default' do
  only_if { node['instance_role'] == 'util' && node['name'] == 'docker' }
end
