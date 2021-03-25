class Passenger < ApplicationRecord
  has_many :passenger_bookings
  has_many :flights, through: :passenger_bookings

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

end
