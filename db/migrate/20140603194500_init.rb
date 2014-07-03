class Init < ActiveRecord::Migration
  def change

    create_table :events do |t|
      t.string      :title
      t.belongs_to  :location
      t.text        :description
      t.timestamp   :starts_at
      t.timestamps
    end

    create_table :locations do |t|
      t.string   :name
      t.string   :slug
      t.float    :lat,               default: 49.0175
      t.float    :lng,               default: 12.1066
      t.text     :description
      t.text     :address
      t.string   :phone
      t.string   :fax
      t.string   :email
      t.string   :url
      t.boolean  :hidden,            default: false,   null: false
      t.belongs_to  :location_group_id
      t.timestamps
    end
    add_attachment :locations, :logo
    
    create_table :location_groups do |t|
      t.string   :name,       null: false
      t.timestamps
    end
    

    create_table :locations_users, id: false do |t|
      t.integer  :location_id
      t.integer  :user_id
    end

    add_index "locations_users", ["location_id", "user_id"], name: "index_locations_users_on_location_id_and_user_id", unique: true, using: :btree
    
    
    create_table :roles, force: true do |t|
      t.string  :identifier
      t.string  :name
      t.integer :position, default: 0, null: false
      t.timestamps
    end

    create_table :roles_users, id: false, force: true do |t|
      t.integer :role_id
      t.integer :user_id
    end


    create_table :users, force: true do |t|
      t.string    :name
      t.string    :login,                          null: false
      t.string    :email,                          null: false
      t.string    :crypted_password,               null: false
      t.string    :password_salt,                  null: false
      t.string    :persistence_token,              null: false
      t.integer   :login_count,        default: 0, null: false
      t.integer   :failed_login_count, default: 0, null: false
      t.timestamp :last_request_at
      t.timestamp :current_login_at
      t.timestamp :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.timestamps
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
    add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
    add_index "users", ["persistence_token"], name: "index_users_on_persistence_token", unique: true, using: :btree

  end
end
