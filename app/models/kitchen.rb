class Kitchen < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

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
