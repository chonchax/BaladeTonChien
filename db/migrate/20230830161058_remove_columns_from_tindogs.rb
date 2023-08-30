class RemoveColumnsFromTindogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :tindogs, :swipe, :string
    remove_column :tindogs, :match, :string
  end
end
