class User < ApplicationRecord
  has_many :kitchens
  has_many :bookings
  # has_many :kitchens, through: :bookings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
