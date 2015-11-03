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

ActiveRecord::Schema.define(version: 20151102220651) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "supplier_id"
    t.string   "account_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "accounts", ["supplier_id"], name: "index_accounts_on_supplier_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.integer  "location_id"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
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
    t.float    "rating",            default: 0.0,     null: false
    t.boolean  "hidden",            default: false,   null: false
    t.integer  "location_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "locations_properties", id: false, force: :cascade do |t|
    t.integer "location_id"
    t.integer "property_id"
  end

  add_index "locations_properties", ["property_id", "location_id"], name: "index_locations_properties_on_location_id_and_property_id", unique: true

  create_table "locations_users", id: false, force: :cascade do |t|
    t.integer "location_id"
    t.integer "user_id"
  end

  add_index "locations_users", ["location_id", "user_id"], name: "index_locations_users_on_location_id_and_user_id", unique: true

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.integer  "property_group_id", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "identifier"
    t.string   "name"
    t.integer  "position",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "statics", force: :cascade do |t|
    t.string   "title"
    t.string   "subheadline"
    t.text     "content"
    t.boolean  "hidden",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
