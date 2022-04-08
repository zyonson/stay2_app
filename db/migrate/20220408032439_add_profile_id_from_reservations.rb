class AddProfileIdFromReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :profile_id, :integer
  end
end
