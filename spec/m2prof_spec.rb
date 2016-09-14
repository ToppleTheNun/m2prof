RSpec.describe M2Prof do
  it 'has a ROOT constant' do
    expect(M2Prof::ROOT).to_not be_nil
  end

  it 'has a VERSION constant' do
    expect(M2Prof::VERSION).to_not be_nil
  end

  describe '.m2_settings_home' do
    it { should respond_to :m2_settings_home }

    before(:each) do
      @cached_env = ENV['M2_SETTINGS_HOME']
    end
    after(:each) do
      ENV['M2_SETTINGS_HOME'] = @cached_env
    end

    context 'when M2_SETTINGS_HOME is set' do
      it "is #{Dir.pwd}/tmp" do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp"
        expect(M2Prof.m2_settings_home).to eq "#{Dir.pwd}/tmp"
      end
    end

    context 'when M2_SETTINGS_HOME is not set' do
      it "is #{Dir.home}/.m2" do
        ENV['M2_SETTINGS_HOME'] = nil
        expect(M2Prof.m2_settings_home).to eq "#{Dir.home}/.m2"
      end
    end
  end
end