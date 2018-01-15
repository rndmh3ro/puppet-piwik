require 'spec_helper'
describe 'piwik' do
  context 'with default values for all parameters' do
    it { should contain_class('piwik') }
  end
end
