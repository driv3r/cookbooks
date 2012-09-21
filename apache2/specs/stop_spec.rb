require 'minitest/spec'

describe_recipe 'apache2::stop' do
  include MiniTest::Chef::Resources
  include MiniTest::Chef::Assertions

  it 'stops apache2' do
    case node[:platform]
    when 'centos','amazon','redhat','fedora','scientific','oracle'
      service('httpd').wont_be_running
    when 'ubuntu','debian'
      service('apache2').wont_be_running
    end
  end
end