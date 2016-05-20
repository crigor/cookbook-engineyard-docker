require 'chefspec'

describe 'main::default' do
  let :chef_run do
    runner.converge described_recipe
  end

  let :runner do
    ChefSpec::SoloRunner.new(cookbook_path: './berks-cookbooks',
      platform: 'gentoo', version: '2.1')
  end

  context 'in utility instances' do
    let :runner do
      ChefSpec::SoloRunner.new(cookbook_path: './berks-cookbooks',
        platform: 'gentoo', version: '2.1') do |node|
        node.default['instance_role'] = 'util'
        node.default['name'] = 'docker'
      end
    end 
    it 'installs docker' do
      expect(chef_run).to create_docker_installation_package('default')
    end
  end

  context 'in other instances' do
    it 'does nothing' do
      expect(chef_run).to_not create_docker_installation_package 'app-emulation/docker'
    end
  end
end
