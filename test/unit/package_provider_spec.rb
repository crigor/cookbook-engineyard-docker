require 'chefspec'

describe 'main::package_provider' do
  let :runner do
    ChefSpec::SoloRunner.new cookbook_path: './berks-cookbooks',
      platform: 'gentoo', version: '2.1',
      step_into: %w(docker_installation_package)
  end

  let :chef_run do
    runner.converge 'main::package_provider'
  end

  it do
    expect(chef_run).to install_package('app-emulation/docker')
      .with_version '1.7.1'
  end
end
