class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :departure_airport_id
      t.belongs_to :aero_plan
      t.integer :destination_airport_id
      t.decimal :price_per_business
      t.decimal :price_per_economy
      t.decimal :price_per_first
      t.timestamps
    end
  end
end
