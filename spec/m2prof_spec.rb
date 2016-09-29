RSpec.describe M2Prof do
  it { should be_const_defined(:ROOT) }

  it { should be_const_defined(:VERSION) }

  describe '.m2_settings_home' do
    it { is_expected.to respond_to :m2_settings_home }

    before(:context) do
      @cached_env = ENV['M2_SETTINGS_HOME']
    end
    after(:context) do
      ENV['M2_SETTINGS_HOME'] = @cached_env
    end

    context 'when M2_SETTINGS_HOME is set' do
      before(:each) do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp"
      end
      subject { M2Prof.m2_settings_home }
      it { is_expected.to eq "#{Dir.pwd}/tmp" }
    end

    context 'when M2_SETTINGS_HOME is not set' do
      before(:each) do
        ENV['M2_SETTINGS_HOME'] = nil
      end
      subject { M2Prof.m2_settings_home }
      it { is_expected.to eq "#{Dir.home}/.m2" }
    end
  end
end