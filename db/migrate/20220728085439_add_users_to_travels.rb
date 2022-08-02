class AddUsersToTravels < ActiveRecord::Migration[6.0]
  def change
    add_reference :travels, :user, null: false, foreign_key: true
  end
end
