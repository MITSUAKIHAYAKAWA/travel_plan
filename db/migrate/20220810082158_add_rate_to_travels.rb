class AddRateToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :rate, :integer
  end
end
