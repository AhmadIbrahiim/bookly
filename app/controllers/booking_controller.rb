require 'base64'

class BookingController < ApplicationController
  def checkout
    seat_type = params[:flight_level]
    flight_id = params[:flight_selected]
    commit = params[:commit]
    @flight_info = Flight.find(flight_id)
    if commit == "Order"
      number_of_seats_at_this_flight = Flight.find(flight_id).aero_plan.seat_configurations.select("sum(number_of_rows * seats_in_rows)").group("seat_configurations.id").first&.sum
      number_of_booked_seats = Flight.find(flight_id).passengers.count
      @total_price = @flight_info.price_per_economy if seat_type == "Economy"
      @total_price = @flight_info.price_per_business if seat_type == "Business"
      @total_price = @flight_info.price_per_first if seat_type == "FirstClass"
    elsif commit == "Confirm"
      passenger = Passenger.create(name: params[:name], email: params[:email])
      @flight_booking = PassengerBooking.create(flight: @flight_info , passenger: passenger, seat_type: seat_type, paid_price: params[:total_price])
    end
  end

  def choose_your_seat
    @flight = PassengerBooking.where(pnr: params[:pnr]).first.flight
    @booking = PassengerBooking.where(pnr: params[:pnr]).first
    @seats = @flight.aero_plan.seat_configurations.order('seat_type desc')
  end
  def confirm_seat
    PassengerBooking.where(pnr: params[:pnr]).first&.update(row_number: params[:row],seat_number: params[:seat])
    render plain: 'Seat created.', status: 200
  end
end
