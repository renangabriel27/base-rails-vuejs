class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :videos, dependent: :destroy

  mount_uploader :profile_image, ProfileImageUploader
end
