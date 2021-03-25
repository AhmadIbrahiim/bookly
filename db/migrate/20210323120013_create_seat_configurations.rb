class CreateSeatConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :seat_configurations do |t|
      t.integer :seat_type
      t.integer :number_of_rows
      t.integer :seats_in_rows
      t.timestamps
    end
  end
end
