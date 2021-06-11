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

ActiveRecord::Schema.define(version: 2021_06_10_224922) do

  create_table "machines", force: :cascade do |t|
    t.integer "store_id", null: false
    t.string "maker"
    t.integer "form_type", default: 0
    t.string "name"
    t.integer "machine_status", default: 0
    t.integer "parts_status", default: 0
    t.integer "place", default: 0
    t.boolean "certification", default: false
    t.string "remarks"
    t.string "front_number"
    t.string "flame_number"
    t.string "board_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_machines_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.integer "pachinko_num", null: false
    t.integer "slot_num", null: false
    t.integer "code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "store_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "machines", "stores"
end
