require 'm2prof/commands/list'

RSpec.describe M2Prof::Commands::List do
  describe '.new' do
    it { is_expected.to_not be_nil }
    it { is_expected.to be_instance_of M2Prof::Commands::List }
    it { is_expected.to respond_to :handle }
  end

  describe '#handle' do
    let(:list) { M2Prof::Commands::List.new }
    before(:context) do
      @cached_env = ENV['M2_SETTINGS_HOME']
    end
    after(:context) do
      ENV['M2_SETTINGS_HOME'] = @cached_env
    end

    context 'when no settings.xml exists' do
      before(:example) do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/none"
      end

      it 'prints to stdout' do
        expect { list.handle(nil, nil) }.to output.to_stdout
      end

      it 'prints "default" to stdout' do
        expect { list.handle(nil, nil) }.to output("default\n").to_stdout
      end
    end

    context 'when the default settings.xml exists' do
      before(:example) do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/default"
      end

      it 'prints to stdout' do
        expect { list.handle(nil, nil) }.to output.to_stdout
      end

      it 'prints "default" to stdout' do
        expect { list.handle(nil, nil) }.to output("default\n").to_stdout
      end
    end

    context 'when multiple settings.xml exist' do
      before(:example) do
        ENV['M2_SETTINGS_HOME'] = "#{Dir.pwd}/tmp/multiple"
      end

      it 'prints to stdout' do
        expect { list.handle(nil, nil) }.to output.to_stdout
      end

      it 'prints "one" and "two" and "three" to stdout' do
        expect { list.handle(nil, nil) }.to output("four\nthree\none\ntwo\ndefault\n").to_stdout
      end
    end
  end
end
