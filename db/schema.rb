ActiveRecord::Schema.define(version: 2019_11_30_044529) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "description"
    t.date "date"
    t.integer "user_id"
  end

  create_table "memories", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "bio"
    t.boolean "admin", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
