require 'fileutils'
require 'm2prof/commands/which'

RSpec.describe M2Prof::Commands::Which do
  describe '.new' do
    it { is_expected.to_not be_nil }
    it { is_expected.to be_instance_of M2Prof::Commands::Which }
    it { is_expected.to respond_to :handle }
  end

  describe '#handle' do
    let(:which) { M2Prof::Commands::Which.new }
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

      it 'prints to stdout' do
        expect { which.handle(nil, nil) }.to output.to_stdout
      end

      it 'prints "default" to stdout' do
        expect { which.handle(nil, nil) }.to output("default\n").to_stdout
      end
    end

    context 'when the settings.xml exists and is not a symlink' do
      before do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/default"
      end

      it 'prints to stdout' do
        expect { which.handle(nil, nil) }.to output.to_stdout
      end

      it 'prints "default" to stdout' do
        expect { which.handle(nil, nil) }.to output("default\n").to_stdout
      end
    end

    context 'when the settings.xml exists and is a symlink to an existing file' do
      before do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/multiple"
        File.symlink("#{M2Prof.m2_settings_home}/settings_one.xml", "#{M2Prof.m2_settings_home}/settings.xml")
      end

      after do
        File.delete("#{M2Prof.m2_settings_home}/settings.xml")
      end

      it 'prints to stdout' do
        expect { which.handle(nil, nil) }.to output.to_stdout
      end

      it 'prints "one" to stdout' do
        expect { which.handle(nil, nil) }.to output("one\n").to_stdout
      end
    end

    context 'when the settings.xml exists and is a symlink to a non-existent file' do
      before do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/multiple"
        File.symlink("#{M2Prof.m2_settings_home}/settings_six.xml", "#{M2Prof.m2_settings_home}/settings.xml")
      end

      after do
        File.delete("#{M2Prof.m2_settings_home}/settings.xml")
      end

      it 'prints to stdout' do
        expect { which.handle(nil, nil) }.to output.to_stdout
      end

      it 'prints "default" to stdout' do
        expect { which.handle(nil, nil) }.to output("default\n").to_stdout
      end
    end
  end
end