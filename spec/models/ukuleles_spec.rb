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

    it "youtube method can parse URL without extra arguments" do
      url = "https://www.youtube.com/watch?v=eNxO9MpQ2vA"
      expect(ukulele.youtube(url)).to eq('eNxO9MpQ2vA')
    end

    it "youtube method can parse share URL" do
      url = "https://youtu.be/eNxO9MpQ2vA"
      expect(ukulele.youtube(url)).to eq('eNxO9MpQ2vA')
    end

    it "youtube method can parse share URL with mid-video start" do
      url = "https://youtu.be/eNxO9MpQ2vA?t=9s"
      expect(ukulele.youtube(url)).to eq('eNxO9MpQ2vA')
    end

    it "youtube method can parse embed code" do
      url = '<iframe width="560" height="315" src="https://www.youtube.com/embed/eNxO9MpQ2vA" frameborder="0" allowfullscreen></iframe>'
      expect(ukulele.youtube(url)).to eq('eNxO9MpQ2vA')
    end

    it "youtube method can parse empty url" do
      url = ""
      expect(ukulele.youtube(url)).to eq('')
    end

    it "youtube method can parse nil url" do
      url = nil
      expect(ukulele.youtube(url)).to eq('')
    end
  end
end
