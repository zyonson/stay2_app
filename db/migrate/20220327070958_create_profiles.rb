class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :rename
      t.string :avatar
      t.text :description

      t.timestamps
    end
  end
end
