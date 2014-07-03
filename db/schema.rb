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

ActiveRecord::Schema.define(version: 20140603194500) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.integer  "location_id"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.float    "lat",               default: 49.0175
    t.float    "lng",               default: 12.1066
    t.text     "description"
    t.text     "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "url"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "hidden",            default: false,   null: false
    t.integer  "location_group_id", default: 1,       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations_users", id: false, force: true do |t|
    t.integer "location_id"
    t.integer "user_id"
  end

  add_index "locations_users", ["location_id", "user_id"], name: "index_locations_users_on_location_id_and_user_id", unique: true

  create_table "posts", force: true do |t|
    t.string   "headline"
    t.string   "subheadline"
    t.text     "content"
    t.boolean  "published"
    t.datetime "published_at"
    t.integer  "category_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "identifier"
    t.string   "name"
    t.integer  "position",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "statics", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "subheadline"
    t.text     "content"
    t.boolean  "hidden",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "login",                          null: false
    t.string   "email",                          null: false
    t.string   "crypted_password",               null: false
    t.string   "password_salt",                  null: false
    t.string   "persistence_token",              null: false
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["persistence_token"], name: "index_users_on_persistence_token", unique: true

end
