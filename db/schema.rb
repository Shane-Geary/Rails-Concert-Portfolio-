ActiveRecord::Schema.define(version: 2020_10_27_194440) do

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "artist"
    t.integer "user_id", null: false
    t.integer "venue_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
    t.index ["venue_id"], name: "index_tickets_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

  add_foreign_key "tickets", "users"
  add_foreign_key "tickets", "venues"
  add_foreign_key "venues", "users"
end
