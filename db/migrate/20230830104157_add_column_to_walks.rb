class AddColumnToWalks < ActiveRecord::Migration[7.0]
  def change
    add_column :walks, :geometry, :jsonb
  end
end
