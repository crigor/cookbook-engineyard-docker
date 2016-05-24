docker_installation_binary 'default' do
  only_if { node['instance_role'] == 'util' && node['name'] == 'docker' }
end

docker_service_manager 'default' do
  only_if { node['instance_role'] == 'util' && node['name'] == 'docker' }
end
