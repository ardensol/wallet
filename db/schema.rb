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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120523013145) do

  create_table "document_categories", :force => true do |t|
    t.string   "user_type"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "document_listings", :force => true do |t|
    t.integer  "document_id"
    t.integer  "listing_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "document_packages", :force => true do |t|
    t.integer  "document_id"
    t.integer  "package_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "file"
    t.integer  "user_id"
    t.date     "as_of_date"
    t.integer  "document_category_id"
  end

  create_table "dropbox_users", :force => true do |t|
    t.string   "uid"
    t.string   "access_key"
    t.string   "access_secret"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "dwolla_users", :force => true do |t|
    t.string   "uid"
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "listings", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "listings", ["identifier"], :name => "index_listings_on_identifier"

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "identifier"
  end

  create_table "renter_profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "mobile_num"
    t.string   "home_num"
    t.string   "work_num"
    t.string   "fax_num"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.date     "date_of_birth"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shared_listings", :force => true do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "listing_id"
    t.integer  "sender_id"
    t.string   "receiver_email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "shared_packages", :force => true do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "package_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "sender_id"
    t.string   "receiver_email"
    t.string   "listing_identifier"
  end

  create_table "submitted_packages", :force => true do |t|
    t.integer  "package_id"
    t.integer  "listing_id"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "submitted_packages", ["listing_id"], :name => "index_submitted_packages_on_listing_id"
  add_index "submitted_packages", ["package_id"], :name => "index_submitted_packages_on_package_id"

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "facebook_token"
    t.string   "dwolla_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
