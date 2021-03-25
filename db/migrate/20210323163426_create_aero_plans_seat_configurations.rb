class CreateAeroPlansSeatConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :aero_plans_seat_configurations do |t|
      t.belongs_to :aero_plan
      t.belongs_to :seat_configuration
      t.timestamps
    end
  end
end
