class UkuleleShape < ApplicationRecord
  validates :ukulele_shape, presence: true, uniqueness: true
end
