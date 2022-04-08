class RemoveProfileIdFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :profile_id, :integer
  end
end
