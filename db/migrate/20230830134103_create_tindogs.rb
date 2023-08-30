class CreateTindogs < ActiveRecord::Migration[7.0]
  def change
    create_table :tindogs do |t|
      t.string :swipe, default: "not yet"
      t.string :match, default: "pending"
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
