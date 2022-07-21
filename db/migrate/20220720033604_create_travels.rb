class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.integer :travel_time_one_id
      t.integer :travel_time_two_id
      t.integer :destination_id
      t.integer :transportation_id
      t.string :travel_title
      t.timestamps
    end
  end
end
