RSpec.describe M2Prof::Wizardry do
  it { is_expected.to respond_to :fetch_sanitized_settings }

  describe '.fetch_sanitized_settings' do
    before(:context) do
      @cached_env = ENV['M2_SETTINGS_HOME']
    end
    after(:context) do
      ENV['M2_SETTINGS_HOME'] = @cached_env
    end

    context 'when no settings.xml exists' do
      before do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/none"
      end

      subject { M2Prof::Wizardry.fetch_sanitized_settings }
      it { is_expected.to have_exactly(1).items }
      it { is_expected.to eq ['default']}
    end

    context 'when the default settings.xml exists' do
      before do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/default"
      end

      subject { M2Prof::Wizardry.fetch_sanitized_settings }
      it { is_expected.to have_exactly(1).items }
      it { is_expected.to eq ['default']}
    end

    context 'when multiple settings.xml exist' do
      before do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/multiple"
      end

      subject { M2Prof::Wizardry.fetch_sanitized_settings }
      it { is_expected.to have_exactly(5).items }
      it { is_expected.to eq %w(four three one two default) }
    end
  end
end
