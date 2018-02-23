class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # has_many :users, through: :bookings

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  mount_uploader :picture, PhotoUploader
end
