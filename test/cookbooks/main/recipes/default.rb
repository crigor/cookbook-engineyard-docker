is_util_instance = node['instance_role'] == 'util' && node['name'] == 'docker'

docker_installation_tarball 'default' do
  only_if { is_util_instance }
end

docker_service_manager 'default' do
  only_if { is_util_instance }
end
