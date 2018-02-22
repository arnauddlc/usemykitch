class Kitchen < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end
