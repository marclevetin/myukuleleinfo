class UkuleleType < ApplicationRecord
  validates :ukulele_id, presence: true

  belongs_to :ukuleles
end
