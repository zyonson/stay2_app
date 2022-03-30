class AddProfileIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :profile_id, :integer
  end
end
