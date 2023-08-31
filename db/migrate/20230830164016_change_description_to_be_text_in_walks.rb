class ChangeDescriptionToBeTextInWalks < ActiveRecord::Migration[7.0]
  def change
    change_column :walks, :description, :text
  end
end
