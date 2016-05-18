directory '/etc/portage/package.accept_keywords'

file '/etc/portage/package.accept_keywords/docker' do
  content <<-eos
# required by dev-go/go-md2man-1.0.3::gentoo
# required by app-emulation/docker-1.9.0::gentoo
# required by =app-emulation/docker-1.9.0 (argument)
=dev-go/blackfriday-1.2_p20150720 ~amd64
# required by dev-go/blackfriday-1.2_p20150720::gentoo
# required by dev-go/go-md2man-1.0.3::gentoo
# required by app-emulation/docker-1.9.0::gentoo
# required by =app-emulation/docker-1.9.0 (argument)
=dev-go/sanitized-anchor-name-0_pre20150822 ~amd64
# required by app-emulation/docker-1.9.0::gentoo
# required by =app-emulation/docker-1.9.0 (argument)
=dev-go/go-md2man-1.0.3 ~amd64
# required by =app-emulation/docker-1.9.0 (argument)
=app-emulation/docker-1.9.0 ~amd64
  eos
end

docker_installation_package 'default' do
  package_name 'app-emulation/docker'
  package_version '1.9.0'
  only_if { node['instance_role'] == 'util' && node['name'] == 'docker' }
end
