class User < ApplicationRecord
  include CarrierWave::MiniMagick
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :ukuleles

  mount_uploader :avatar, AvatarUploader

  process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fill: [200,200]
  end
end
