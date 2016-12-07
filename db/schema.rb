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

ActiveRecord::Schema.define(version: 20161207124831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jam_session_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "jam_session_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["jam_session_id"], name: "index_jam_session_users_on_jam_session_id", using: :btree
    t.index ["user_id"], name: "index_jam_session_users_on_user_id", using: :btree
  end

  create_table "jam_sessions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.text     "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.integer  "jam_session_id"
    t.integer  "song_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["jam_session_id"], name: "index_playlists_on_jam_session_id", using: :btree
    t.index ["song_id"], name: "index_playlists_on_song_id", using: :btree
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "lyrics"
    t.string   "chords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_songs", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_user_songs_on_song_id", using: :btree
    t.index ["user_id"], name: "index_user_songs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "jam_session_users", "jam_sessions"
  add_foreign_key "jam_session_users", "users"
  add_foreign_key "playlists", "jam_sessions"
  add_foreign_key "playlists", "songs"
  add_foreign_key "user_songs", "songs"
  add_foreign_key "user_songs", "users"
end
