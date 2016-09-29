require 'm2prof/commands/which'

RSpec.describe M2Prof::Commands::Which do
  describe '.new' do
    it { is_expected.to_not be_nil }
    it { is_expected.to be_instance_of M2Prof::Commands::Which }
    it { is_expected.to respond_to :handle }
  end
end