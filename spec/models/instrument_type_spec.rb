require "spec_helper"

RSpec.describe InstrumentType, type: :model do
  let(:instrument) { InstrumentType.create(instrument_type: 'ukulele') }
  let(:instrument2) { InstrumentType.create(instrument_type: 'ukulele') }

  describe "instrument type is unique" do
    it "instrument type is unique" do
      expect(instrument.valid?).to eq(true)
      expect(instrument2.valid?).to eq(false)
    end
  end
end
