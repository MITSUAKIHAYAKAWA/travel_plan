class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.date :travel_time_one
      t.date :travel_time_two
      t.integer :destination_id
      t.integer :transportation_id
      t.string :travel_title
      t.timestamps
    end
  end
end
