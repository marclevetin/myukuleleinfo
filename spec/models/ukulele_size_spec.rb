require "spec_helper"

RSpec.describe UkuleleSize, type: :model do
  let(:size) { UkuleleSize.create(ukulele_size: 'soprano') }

  describe "instrument type is unique" do
    # assumes database already seeded
    it "instrument type is unique" do
      expect(size.valid?).to eq(false)
    end
  end
end
