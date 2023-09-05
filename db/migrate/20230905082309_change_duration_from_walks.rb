class ChangeDurationFromWalks < ActiveRecord::Migration[7.0]
  def change
    change_column :walks, :duration, 'integer USING CAST(duration AS integer)'
  end
end
