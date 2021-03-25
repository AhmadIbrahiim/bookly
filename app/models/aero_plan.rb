class AeroPlan < ApplicationRecord
  has_many :aero_plans_seat_configurations
  has_many :seat_configurations, through: :aero_plans_seat_configurations

end
