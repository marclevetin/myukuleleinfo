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

    it "string count must be a number" do
      uke = Ukulele.create!(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        string_count: '4'
      )
      uke2 = Ukulele.create(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        string_count: 'four'
      )
      expect(uke.valid?).to eq(true)
      expect(uke2.valid?).to eq(false)
    end

    it "neck width must be a number" do
      uke = Ukulele.create!(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        neck_width: '1.5'
      )
      uke2 = Ukulele.create(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        neck_width: 'four'
      )
      expect(uke.valid?).to eq(true)
      expect(uke2.valid?).to eq(false)
    end

    it "scale length must be a number" do
      uke = Ukulele.create!(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        length_scale: '16'
      )
      uke2 = Ukulele.create(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        length_scale: 'sixteen'
      )
      expect(uke.valid?).to eq(true)
      expect(uke2.valid?).to eq(false)
    end

    it "body length must be a number" do
      uke = Ukulele.create!(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        length_body: '19'
      )
      uke2 = Ukulele.create(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        length_body: 'nineteen'
      )
      expect(uke.valid?).to eq(true)
      expect(uke2.valid?).to eq(false)
    end

    it "body width must be a number" do
      uke = Ukulele.create!(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        width: '4'
      )
      uke2 = Ukulele.create(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        width: 'four'
      )
      expect(uke.valid?).to eq(true)
      expect(uke2.valid?).to eq(false)
    end

    it "body depth must be a number" do
      uke = Ukulele.create!(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        depth: '4'
      )
      uke2 = Ukulele.create(
        instrument_type: 'ukulele',
        ukulele_shape: 'double bout',
        ukulele_size: 'soprano',
        depth: 'four'
      )
      expect(uke.valid?).to eq(true)
      expect(uke2.valid?).to eq(false)
    end
  end
end
