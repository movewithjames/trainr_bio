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

ActiveRecord::Schema.define(version: 20200214173446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "trainer_id"
    t.integer "trainee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainee_id"], name: "index_events_on_trainee_id"
    t.index ["trainer_id"], name: "index_events_on_trainer_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "phone"
    t.string "img_url"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_studios", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_user_studios_on_studio_id"
    t.index ["user_id"], name: "index_user_studios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "phone"
    t.string "location"
    t.string "first_name"
    t.string "last_name"
    t.string "img_url"
    t.string "instragram_url"
    t.string "facebook_url"
    t.string "website_url"
    t.string "tik_tok_url"
    t.text "description"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
