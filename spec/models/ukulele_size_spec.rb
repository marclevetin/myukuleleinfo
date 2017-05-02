require "spec_helper"

RSpec.describe UkuleleSize, type: :model do
  let(:size) { UkuleleSize.create(ukulele_size: 'soprano') }
  let(:size2) { UkuleleSize.create(ukulele_size: 'soprano') }

  describe "instrument type is unique" do
    it "instrument type is unique" do
      expect(size.valid?).to eq(true)
      expect(size2.valid?).to eq(false)
    end
  end
end
