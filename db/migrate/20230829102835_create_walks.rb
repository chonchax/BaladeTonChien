class CreateWalks < ActiveRecord::Migration[7.0]
  def change
    create_table :walks do |t|
      t.float :start_address_longitude
      t.float :start_address_latitude
      t.float :end_address_longitude
      t.float :end_address_latitude
      t.string :city
      t.float :distance
      t.string :title
      t.integer :difficulty
      t.boolean :leash
      t.integer :water_presence
      t.integer :shadow_presence

      t.timestamps
    end
  end
end
