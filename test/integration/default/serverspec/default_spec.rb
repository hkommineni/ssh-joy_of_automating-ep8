require 'spec_helper'

describe 'ssh::default' do
  describe file('/root/.ssh/config') do
    it { should exist }
    its(:content) { should match(/user builder/) }
  end
end
