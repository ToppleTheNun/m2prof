RSpec.describe Object do
  describe '#blank?' do
    context 'nil' do
      subject { nil.blank? }
      it { is_expected.to be_truthy }
    end

    context 'false' do
      subject { false.blank? }
      it { is_expected.to be_truthy }
    end

    context '\'\'' do
      subject { ''.blank? }
      it { is_expected.to be_truthy }
    end

    context '[]' do
      subject { [].blank? }
      it { is_expected.to be_truthy }
    end

    context 'true' do
      subject { true.blank? }
      it { is_expected.to be_falsey }
    end

    context '\'foobar\'' do
      subject { 'foobar'.blank? }
      it { is_expected.to be_falsey }
    end

    context '[1, 2, 3]' do
      subject { [1, 2, 3].blank? }
      it { is_expected.to be_falsey }
    end

    context '6' do
      subject { 6.blank? }
      it { is_expected.to be_falsey }
    end

    context 'current Time' do
      subject { Time.now.blank? }
      it { is_expected.to be_falsey }
    end

    context 'Struct' do
      subject { Struct.new('M2ProfTest', :name).blank? }
      it { is_expected.to be_falsey }
    end
  end

  describe '#present?' do
    context 'nil' do
      subject { nil.present? }
      it { is_expected.to be_falsey }
    end

    context 'false' do
      subject { false.present? }
      it { is_expected.to be_falsey }
    end

    context '\'\'' do
      subject { ''.present? }
      it { is_expected.to be_falsey }
    end

    context '[]' do
      subject { [].present? }
      it { is_expected.to be_falsey }
    end

    context 'true' do
      subject { true.present? }
      it { is_expected.to be_truthy }
    end

    context '\'foobar\'' do
      subject { 'foobar'.present? }
      it { is_expected.to be_truthy }
    end

    context '[1, 2, 3]' do
      subject { [1, 2, 3].present? }
      it { is_expected.to be_truthy }
    end

    context '6' do
      subject { 6.present? }
      it { is_expected.to be_truthy }
    end

    context 'current Time' do
      subject { Time.now.present? }
      it { is_expected.to be_truthy }
    end

    context 'Struct' do
      subject { Struct.new('M2ProfTest', :name).present? }
      it { is_expected.to be_truthy }
    end
  end

  describe '#presence' do
    context 'nil' do
      subject { nil.presence }
      it { is_expected.to be_nil }
    end

    context 'false' do
      subject { false.presence }
      it { is_expected.to be_nil }
    end

    context '\'\'' do
      subject { ''.presence }
      it { is_expected.to be_nil }
    end

    context '[]' do
      subject { [].presence }
      it { is_expected.to be_nil }
    end

    context 'true' do
      subject { true.presence }
      it { is_expected.to_not be nil }
    end

    context '\'foobar\'' do
      subject { 'foobar'.presence }
      it { is_expected.to_not be nil }
    end

    context '[1, 2, 3]' do
      subject { [1, 2, 3].presence }
      it { is_expected.to_not be nil }
    end

    context '6' do
      subject { 6.presence }
      it { is_expected.to_not be nil }
    end

    context 'current Time' do
      subject { Time.now.presence }
      it { is_expected.to_not be nil }
    end

    context 'Struct' do
      subject { Struct.new('M2ProfTest', :name).presence }
      it { is_expected.to_not be nil }
    end
  end
end