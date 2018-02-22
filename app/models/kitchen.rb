class Kitchen < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
