class Flight < ApplicationRecord
  belongs_to :aero_plan
  belongs_to :departure_from, class_name: 'AirPort', foreign_key: "departure_airport_id"
  belongs_to :arrive_to, class_name: 'AirPort', foreign_key: "destination_airport_id"
  has_many :passenger_bookings
  has_many :passengers, through: :passenger_bookings


  def self.search(from, to, date)
    date = date.to_date
    where(departure_airport_id: from, destination_airport_id: to, date: date.beginning_of_day..date.end_of_day)
  end
end

