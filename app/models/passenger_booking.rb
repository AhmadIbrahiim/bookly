class PassengerBooking < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger
  enum seat_type: [:Economy, :Business, :FirstClass]
  after_create :generate_pnr


  def generate_pnr
    update_attributes!(:pnr => rand(36**8).to_s(36))
  end

end
