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

ActiveRecord::Schema.define(version: 2018_12_10_072825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.boolean "confirmed", default: false
    t.datetime "start_time"
    t.string "visitor_email"
    t.string "visitor_name"
    t.bigint "user_id"
    t.bigint "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["gallery_id"], name: "index_appointments_on_gallery_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "dates"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_exhibitions_on_user_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "photo"
    t.bigint "user_id"
    t.string "open_time"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "paintings", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "status"
    t.string "value"
    t.bigint "gallery_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.bigint "user_id"
    t.boolean "featured", default: false
    t.index ["artist_id"], name: "index_paintings_on_artist_id"
    t.index ["gallery_id"], name: "index_paintings_on_gallery_id"
    t.index ["user_id"], name: "index_paintings_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "user_id"
    t.bigint "exhibition_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["artist_id"], name: "index_samples_on_artist_id"
    t.index ["exhibition_id"], name: "index_samples_on_exhibition_id"
    t.index ["user_id"], name: "index_samples_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "galleries"
  add_foreign_key "appointments", "users"
  add_foreign_key "artists", "users"
  add_foreign_key "exhibitions", "users"
  add_foreign_key "galleries", "users"
  add_foreign_key "paintings", "artists"
  add_foreign_key "paintings", "galleries"
  add_foreign_key "paintings", "users"
  add_foreign_key "samples", "artists"
  add_foreign_key "samples", "exhibitions"
  add_foreign_key "samples", "users"
end
