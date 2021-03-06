# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150427171049) do

  create_table "albums", force: :cascade do |t|
    t.string   "spotify_id"
    t.string   "name"
    t.string   "uri"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string   "spotify_id"
    t.string   "name"
    t.string   "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "playlist_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "playlist_tracks", force: :cascade do |t|
    t.integer  "playlist_id"
    t.integer  "track_id"
    t.boolean  "played"
    t.integer  "order_num"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.integer  "duration_s"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "spotify_id"
    t.string   "name"
    t.string   "uri"
    t.string   "preview_url"
    t.integer  "duration_s"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "album_id"
    t.integer  "artist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "profile_url"
    t.string   "profile_image"
    t.string   "token"
    t.string   "refresh_token"
    t.integer  "expires_at"
    t.boolean  "expires"
    t.string   "provider"
    t.text     "uid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
