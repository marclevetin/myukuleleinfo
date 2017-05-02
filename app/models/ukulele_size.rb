class UkuleleSize < ApplicationRecord
  validates :ukulele_size, presence: true, uniqueness: true
end
