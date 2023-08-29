class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.integer :energy
      t.integer :playfulness
      t.integer :good_with_strangers
      t.integer :good_with_others_dogs
      t.integer :good_with_chidren
      t.string :size
      t.boolean :neutered
      t.integer :good_with_water
      t.integer :shadow_level
      t.string :sexe
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
