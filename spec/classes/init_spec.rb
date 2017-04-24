require 'spec_helper'
describe 'environment_variable' do
  context 'with default values for all parameters' do
    it { should contain_class('environment_variable') }
  end
end
