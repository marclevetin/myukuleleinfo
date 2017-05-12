require "spec_helper"

RSpec.describe UkuleleShape, type: :model do
  let(:shape) { UkuleleShape.create(ukulele_shape: 'pineapple') }

  describe "instrument type is unique" do
    # assumes database already seeded
    it "instrument type is unique" do
      expect(shape.valid?).to eq(false)
    end
  end
end
