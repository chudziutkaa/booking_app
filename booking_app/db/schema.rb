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

ActiveRecord::Schema.define(version: 20160511123403) do

  create_table "comments", force: :cascade do |t|
    t.integer "hotel_id"
    t.text    "content"
    t.string  "author"
  end

  create_table "galleries", force: :cascade do |t|
    t.integer "hotel_id"
    t.string  "name"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "standard"
    t.text   "description"
    t.string "location"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "room_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "gallery_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "hotel_id"
    t.string  "name"
    t.decimal "price"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "number"
    t.integer "hotel_id"
    t.string  "name"
  end

end
