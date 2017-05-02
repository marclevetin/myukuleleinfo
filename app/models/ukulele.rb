class Ukulele < ApplicationRecord
  validates :string_count, numericality: true
  validates :neck_width, numericality: true
  validates :length_scale, numericality: true, allow_nil: true
  validates :length_body, numericality: true, allow_nil: true
  validates :width, numericality: true, allow_nil: true
  validates :depth, numericality: true, allow_nil: true
  validates :string_count, numericality: true, allow_nil: true

  has_many :instrument_types
  has_many :ukulele_shapes
  has_many :ukulele_sizes

  validates :timestamps, presence: true
end
