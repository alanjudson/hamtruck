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

ActiveRecord::Schema.define(version: 20141208172729) do

  create_table "categorizations", force: true do |t|
    t.integer  "truck_id"
    t.integer  "cuisine_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["cuisine_type_id"], name: "index_categorizations_on_cuisine_type_id"
  add_index "categorizations", ["truck_id"], name: "index_categorizations_on_truck_id"

  create_table "cuisine_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "truck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["truck_id"], name: "index_follows_on_truck_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "reviews", force: true do |t|
    t.integer  "stars"
    t.string   "comment"
    t.integer  "truck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reviews", ["truck_id"], name: "index_reviews_on_truck_id"

  create_table "trucks", force: true do |t|
    t.string   "name"
    t.string   "cuisine_type"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",           default: false
  end

end
