class Ukulele < ApplicationRecord
  include PgSearch
  multisearchable :against => [
    :instrument_type,
    :ukulele_shape,
    :ukulele_size,
    :luthier,
    :model,
    :serial_number,
    :purchase_date,
    :body_top,
    :body_sides,
    :body_back,
    :body_neck,
    :body_fretboard,
    :body_binding,
    :tuner_type,
    :tuner_manufacture,
    :string_manufacture,
    :string_count,
    :string_tuning,
    :finish_type,
    :finish_look,
    :pickup,
    :nut_material,
    :saddle_material,
    :neck_width,
    :length_scale,
    :length_body,
    :width,
    :depth,
    :nickname
  ]

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

  def vbulletin
    "#{self.luthier} #{self.model} #{self.ukulele_size}"
  end

  def youtube(url)
    if !url.empty?
      uid_start = url.index("=") + 1
      uid_end = uid_start + 11
      url.slice(uid_start, uid_end)
    end
  end
end
