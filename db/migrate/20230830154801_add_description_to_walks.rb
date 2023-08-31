class AddDescriptionToWalks < ActiveRecord::Migration[7.0]
  def change
    add_column :walks, :description, :string
  end
end
