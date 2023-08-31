class RemoveDogFromTindog < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tindogs, :dog, index: true
    add_reference :tindogs, :sender, null: false, foreign_key: {to_table: :dogs}
    add_reference :tindogs, :receiver, null: false, foreign_key: {to_table: :dogs}
  end
end
