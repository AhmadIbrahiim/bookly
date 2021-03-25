module BookingHelper
  def is_booked?(flight_id,seat_type, row,seat_number)
    PassengerBooking.exists?(flight_id:flight_id,seat_type: seat_type, row_number: row,seat_number: seat_number )
  end
end
