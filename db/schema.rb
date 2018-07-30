# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180730184331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id", null: false
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_groups_on_location_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", id: :serial, force: :cascade do |t|
    t.integer "group_id"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["person_id"], name: "index_memberships_on_person_id"
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "people_posts", id: false, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "person_id", null: false
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
    t.index ["person_id"], name: "index_posts_on_person_id"
  end

  add_foreign_key "groups", "locations"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "people"
  add_foreign_key "posts", "people"
end
