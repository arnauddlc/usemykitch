class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen

  validates :start_date, :end_date, presence: true
  validates :user_id, presence: true
  validates :kitchen_id, presence: true
end
