require 'spec_helper'

describe 'ssh::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'does something' do
    skip 'Replace this with meaningful tests'
  end

  describe file('/root/.ssh/config') do
    its(:content) { should match(/MaxSessions 250/) }
    # its(:content) { should match(/MaxStartups 250/) }
  end
end
