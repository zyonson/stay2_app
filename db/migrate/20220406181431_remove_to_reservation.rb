class RemoveToReservation < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :stay_date, :integer
    remove_column :reservations, :total_price, :integer
  end
end
