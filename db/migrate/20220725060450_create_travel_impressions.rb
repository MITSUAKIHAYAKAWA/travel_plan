class CreateTravelImpressions < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_impressions do |t|
      t.text :impression
      t.references :user, foreign_key: true
      t.references :travel, foreign_key: true
      t.timestamps
    end
  end
end
