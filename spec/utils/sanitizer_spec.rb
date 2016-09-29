RSpec.describe M2Prof::Sanitizer do

  it { is_expected.to respond_to :sanitize }

  describe '.sanitize' do
    context 'given nil argument' do
      subject { lambda { M2Prof::Sanitizer.sanitize(nil) } }
      it { is_expected.to raise_error(ArgumentError, 'str_to_sanitize cannot be nil or empty') }
    end

    context 'given empty String argument' do
      subject { lambda { M2Prof::Sanitizer.sanitize('') } }
      it { is_expected.to raise_error(ArgumentError, 'str_to_sanitize cannot be nil or empty') }
    end

    context 'given empty Array argument' do
      subject { lambda { M2Prof::Sanitizer.sanitize([]) } }
      it { is_expected.to raise_error(ArgumentError, 'str_to_sanitize cannot be nil or empty') }
    end

    context 'given non-empty Array argument' do
      subject { lambda { M2Prof::Sanitizer.sanitize([1, 2, 3]) } }
      it { is_expected.to raise_error(ArgumentError, 'str_to_sanitize must be a String') }
    end

    context 'given sanitary String' do
      subject { M2Prof::Sanitizer.sanitize('foobar') }
      it { is_expected.to eq 'foobar' }
    end

    context 'given String ending with non-alphanumeric character' do
      subject { M2Prof::Sanitizer.sanitize('foobar_') }
      it { is_expected.to eq 'foobar' }
    end

    context 'given String starting with non-alphanumeric character' do
      subject { M2Prof::Sanitizer.sanitize('_foobar') }
      it { is_expected.to eq 'foobar' }
    end

    context 'given String starting and ending with non-alphanumeric character' do
      subject { M2Prof::Sanitizer.sanitize('_foobar_') }
      it { is_expected.to eq 'foobar' }
    end

    context 'given String starting with whitespace' do
      subject { M2Prof::Sanitizer.sanitize(' foobar') }
      it { is_expected.to eq 'foobar' }
    end

    context 'given String starting with whitespace' do
      subject { M2Prof::Sanitizer.sanitize('foobar ') }
      it { is_expected.to eq 'foobar' }
    end
  end
end