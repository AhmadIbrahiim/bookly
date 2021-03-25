class CreateAirPorts < ActiveRecord::Migration[6.0]
  def change
    create_table :air_ports do |t|
      t.string :code
      t.string :city
      t.timestamps
    end
  end
end
