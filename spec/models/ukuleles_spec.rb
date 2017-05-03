require "spec_helper"

RSpec.describe Ukulele, type: :model do
  let(:ukulele) { Ukulele.create(instrument_type: 'ukulele', ukulele_shape: 'double bout', ukulele_size: 'soprano') }
  let(:ukulele_no_type) { Ukulele.create(instrument_type: '', ukulele_shape: 'double bout', ukulele_size: 'soprano') }
  let(:ukulele_no_shape) { Ukulele.create(instrument_type: 'ukulele', ukulele_shape: '', ukulele_size: 'soprano') }
  let(:ukulele_no_size) { Ukulele.create(instrument_type: 'ukulele', ukulele_shape: 'double bout', ukulele_size: '') }

  describe "required fields are required" do
    it "instrument_type is required" do
      expect(ukulele.instrument_type).to eq('ukulele')
      expect(ukulele_no_type.valid?).to eq(false)
    end

    it "ukulele shape is required" do
      expect(ukulele.ukulele_shape).to eq('double bout')
      expect(ukulele_no_shape.valid?).to eq(false)
    end

    it "ukulele_size is required" do
      expect(ukulele.ukulele_size).to eq('soprano')
      expect(ukulele_no_size.valid?).to eq(false)
    end
  end
end
