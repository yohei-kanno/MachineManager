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

ActiveRecord::Schema.define(version: 2021_07_12_113001) do

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "store_id", limit: 36, null: false
    t.string "maker", null: false
    t.integer "form_type", default: 0, null: false
    t.string "name", null: false
    t.integer "machine_status", default: 0, null: false
    t.integer "parts_status", default: 0, null: false
    t.string "place", null: false
    t.integer "certification", default: 0, null: false
    t.string "remarks"
    t.string "front_number"
    t.string "flame_number"
    t.string "board_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_machines_on_store_id"
  end

  create_table "place_machines", force: :cascade do |t|
    t.integer "place_id", null: false
    t.integer "machine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["machine_id"], name: "index_place_machines_on_machine_id"
    t.index ["place_id"], name: "index_place_machines_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name", null: false
    t.string "store_id", limit: 36, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_places_on_store_id"
  end

  create_table "stores", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "name", null: false
    t.string "pachinko_num", null: false
    t.string "slot_num", null: false
    t.string "code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_stores_on_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "store_id", limit: 36, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "machines", "stores"
  add_foreign_key "place_machines", "machines"
  add_foreign_key "place_machines", "places"
  add_foreign_key "places", "stores"
  add_foreign_key "users", "stores"
end
