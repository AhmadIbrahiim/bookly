class CreatePassengerBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :passenger_bookings do |t|
      t.belongs_to :flight, foreign_key: true, null: false
      t.belongs_to :passenger, foreign_key: true, null: false
      t.integer :seat_type
      t.string :pnr
      t.integer :row_number
      t.integer :seat_number
      t.float :paid_price
      t.timestamps
    end
  end
end
