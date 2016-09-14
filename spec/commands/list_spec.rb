require 'm2prof/commands/list'

RSpec.describe M2Prof::Commands::List do
  describe '.new' do
    it { is_expected.to_not be_nil }
    it { is_expected.to be_instance_of M2Prof::Commands::List }
    it { is_expected.to respond_to :handle }
  end
end