class AeroPlansSeatConfiguration < ApplicationRecord
  # belongs_to requires the singular form.
  belongs_to :aero_plan
  belongs_to :seat_configuration
end
