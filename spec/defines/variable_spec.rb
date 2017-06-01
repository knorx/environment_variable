require 'spec_helper'
require 'puppet_factset'
describe 'environment_variable::variable' do
  # Uncomment only the factset you would like to use for these tests
  # system_name = 'AIX-6.1-powerpc'
  # system_name = 'AIX-7.1-powerpc'
  # system_name = 'CentOS-5.11-32'
  # system_name = 'CentOS-5.11-64'
  # system_name = 'CentOS-6.6-32'
  # system_name = 'CentOS-6.6-64'
  # system_name = 'CentOS-7.0-64'
  # system_name = 'CentOS-7.3-64'
  # system_name = 'Debian-6.0.10-32'
  # system_name = 'Debian-6.0.10-64'
  # system_name = 'Debian-7.8-32'
  # system_name = 'Debian-7.8-64'
  # system_name = 'SLES-11.3-64'
  # system_name = 'SLES-12.1-64'
  # system_name = 'Ubuntu-12.04-32'
  # system_name = 'Ubuntu-12.04-64'
  # system_name = 'Ubuntu-14.04-32'
  # system_name = 'Ubuntu-14.04-64'
  # system_name = 'Windows_Server-2008r2-64'
  # system_name = 'Windows_Server-2012r2-64'
  # system_name = 'solaris-10_u9-sparc-64'
  # system_name = 'solaris-11.2-sparc-64'
  ['SLES-12.1-64', 'Windows_Server-2012r2-64'].each { |os|
    context os do
      let :facts do
        PuppetFactset::factset_hash(os)
      end

      let :title do
        "JAVA_HOME"
      end

      let :params do
        {
          :value => "/usr/local/java",
        }
      end

      context 'compiles ok' do
        it { should compile }
      end
    end
  }
end
