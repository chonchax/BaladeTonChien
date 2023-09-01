class AddStatusToTindos < ActiveRecord::Migration[7.0]
  def change
    add_column :tindogs, :status, :string, default: "pending"
  end
end
