class CreateTravelTags < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_tags do |t|
      t.references :travel, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :travel_tags, [:travel_id, :tag_id], unique: true
  end
end
