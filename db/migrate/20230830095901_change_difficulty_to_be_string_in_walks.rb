class ChangeDifficultyToBeStringInWalks < ActiveRecord::Migration[7.0]
  def change
    change_column :walks, :difficulty, :string
  end
end
