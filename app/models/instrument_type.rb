class InstrumentType < ApplicationRecord
  validates :instrument_type, presence: true, uniqueness: true
end
