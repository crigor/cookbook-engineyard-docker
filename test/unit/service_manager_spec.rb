require 'chefspec'
require 'chefspec/berkshelf'

describe 'main::service_manager' do
  let :runner do
    ChefSpec::SoloRunner.new platform: 'gentoo', version: '2.1',
      step_into: %w(docker_service_manager)
  end

  let :chef_run do
    runner.converge 'main::service_manager' do
      manager = runner.find_resource(:docker_service_manager, 'default')
      allow(manager).to receive(:docker_version).and_return '1.7.1'
    end
  end

  it do
    expect(chef_run).to start_service 'docker'
  end

  it do
    expect(chef_run).to enable_service 'docker'
  end

  it do
    expect(chef_run).to create_template('/etc/init.d/docker')
      .with_cookbook 'engineyard_docker'
  end

  it do
    expect(chef_run).to create_template('/etc/conf.d/docker')
      .with_cookbook 'engineyard_docker'
  end

  it do
    expect(chef_run).to render_file('/etc/conf.d/docker').with_content { |c|
      expect(c).to match %r{^DOCKER_BINARY="/usr/bin/docker"}
    }
  end

  it do
    expect(chef_run).to render_file('/etc/conf.d/docker').with_content { |c|
      expect(c).to match %r{^DOCKER_OPTS="--debug"}
    }
  end

  it do
    expect(chef_run).to render_file('/etc/conf.d/docker').with_content { |c|
      expect(c).to match %r{^DOCKER_PIDFILE="/var/run/docker.pid"}
    }
  end

  it do
    expect(chef_run).to render_file('/etc/conf.d/docker').with_content { |c|
      expect(c).to match %r{^DOCKER_LOGFILE="/var/log/docker.log"}
    }
  end

  it do
    expect(chef_run).to render_file('/etc/init.d/docker').with_content { |c|
      expect(c).to match %r{^command_args="-d}
    }
  end
end
