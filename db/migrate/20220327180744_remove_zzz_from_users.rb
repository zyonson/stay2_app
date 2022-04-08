class RemoveZzzFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :icon, :string
    remove_column :users, :introduction, :string
  end
end
