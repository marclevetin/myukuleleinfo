require "spec_helper"

RSpec.describe InstrumentType, type: :model do
  let(:instrument) { InstrumentType.create(instrument_type: 'ukulele') }

  describe "instrument type is unique" do
    # assumes database already seeded
    it "instrument type is unique" do
      expect(instrument.valid?).to eq(false)
    end
  end
end
