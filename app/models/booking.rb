class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen

  validates :start_date, presence: true, on: :create
  validates :end_date, presence: true, on: :create
  validates :user_id, presence: true, on: :create
  validates :kitchen_id, presence: true, on: :create

  validate :start_must_be_today_or_after, :end_must_be_after_start_date, :user_must_not_be_owner, on: :create
  # scope :received_bookings, -> { .where('kitchen_id = ?', ) }

  def start_must_be_today_or_after
  	if start_date.present? && start_date < Date.today
  		errors.add(:start_date, "cannot be in the past")
  	end
  end

  def end_must_be_after_start_date
  	if end_date.present? && end_date <= start_date
  		errors.add(:end_date, "must be after the start date")
  	end
  end

  def user_must_not_be_owner
  	if self.kitchen.user == self.user
  		errors.add(:user_id, "you cannot book your own kitchen!")
  	end
  end

  def approved?
    self.status == "approved"
  end
end
