class Kitchen < ApplicationRecord
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  def booked_before?(user)
  	self.users.include?(user)
  end
end
