class AddDurationToWalks < ActiveRecord::Migration[7.0]
  def change
    add_column :walks, :duration, :string
  end
end
