require "spec_helper"

RSpec.describe UkuleleShape, type: :model do
  let(:shape) { UkuleleShape.create(ukulele_shape: 'pineapple') }
  let(:shape2) { UkuleleShape.create(ukulele_shape: 'pineapple') }

  describe "instrument type is unique" do
    it "instrument type is unique" do
      expect(shape.valid?).to eq(true)
      expect(shape2.valid?).to eq(false)
    end
  end
end
