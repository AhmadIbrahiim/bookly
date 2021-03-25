class SeatConfiguration < ApplicationRecord
  has_many :aero_plans_seat_configurations
  has_many :aero_plans, through: :aero_plans_seat_configurations
  enum seat_type: [:Economy, :Business, :FirstClass]

end
