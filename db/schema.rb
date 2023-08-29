# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema[7.0].define(version: 2023_08_29_123425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_walks", force: :cascade do |t|
    t.bigint "dog_id", null: false
    t.bigint "walk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_dog_walks_on_dog_id"
    t.index ["walk_id"], name: "index_dog_walks_on_walk_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.integer "energy"
    t.integer "playfulness"
    t.integer "good_with_strangers"
    t.integer "good_with_others_dogs"
    t.integer "good_with_chidren"
    t.string "size"
    t.boolean "neutered"
    t.integer "good_with_water"
    t.integer "shadow_level"
    t.string "sexe"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end


  create_table "walks", force: :cascade do |t|
    t.float "start_address_longitude"
    t.float "start_address_latitude"
    t.float "end_address_longitude"
    t.float "end_address_latitude"
    t.string "city"
    t.float "distance"
    t.string "title"
    t.integer "difficulty"
    t.boolean "leash"
    t.integer "water_presence"
    t.integer "shadow_presence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dog_walks", "dogs"
  add_foreign_key "dog_walks", "walks"
  add_foreign_key "dogs", "users"
end