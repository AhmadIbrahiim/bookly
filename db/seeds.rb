airports = {:NYC => "New York",
  :CAI => "Cairo",
  :ALX => "Alexndria",
  :LPL => "Liverpool",
  :BEG => "Belgrade",
  :BER => "Berlin",
  :ZRH => "Zurich"
}

airports.each do |k, v|
AirPort.create(code: k, city: v)
end

all_airports = AirPort.all


SeatConfiguration.create(seat_type: :Business, number_of_rows: 10, seats_in_rows: 10)
SeatConfiguration.create(seat_type: :Economy, number_of_rows: 10, seats_in_rows: 10)
SeatConfiguration.create(seat_type: :FirstClass, number_of_rows: 10, seats_in_rows: 10)


100.times do
  AeroPlan.create(name: "Plan No. #{rand(0..index)}")
end
index = airports.length - 1

1000.times do
departure_airport = all_airports[rand(0..index)].id
destination_airport = all_airports[rand(1..index)].id
Flight.create(date: rand(4.days).seconds.from_now,
      departure_airport_id: departure_airport,
      destination_airport_id: destination_airport,
      price_per_first: rand(200..1000),
      price_per_business: rand(200..1000),
      price_per_economy: rand(200..1000)
      ) if departure_airport != destination_airport
end
