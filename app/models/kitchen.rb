class Kitchen < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end
