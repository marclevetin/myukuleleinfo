class Ukulele < ApplicationRecord
  validates :instrument_type, presence: true
  validates :ukulele_shape, presence: true
  validates :ukulele_size, presence: true
  validates :string_count, numericality: true, allow_nil: true
  validates :neck_width, numericality: true, allow_nil: true
  validates :length_scale, numericality: true, allow_nil: true
  validates :length_body, numericality: true, allow_nil: true
  validates :width, numericality: true, allow_nil: true
  validates :depth, numericality: true, allow_nil: true

  belongs_to :user

  has_many :instrument_types
  has_many :ukulele_shapes
  has_many :ukulele_sizes

  mount_uploaders :photos, UkulelePhotosUploader
end
