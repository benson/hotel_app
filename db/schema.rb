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

ActiveRecord::Schema.define(:version => 20130318195009) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies_customers", :id => false, :force => true do |t|
    t.integer "customer_id", :null => false
    t.integer "company_id",  :null => false
  end

  add_index "companies_customers", ["customer_id", "company_id"], :name => "index_companies_customers_on_customer_id_and_company_id", :unique => true

  create_table "companies_reservations", :id => false, :force => true do |t|
    t.integer "company_id",     :null => false
    t.integer "reservation_id", :null => false
  end

  add_index "companies_reservations", ["company_id", "reservation_id"], :name => "index_companies_reservations_on_company_id_and_reservation_id", :unique => true

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.integer  "company_id"
  end

  create_table "customers_reservations", :id => false, :force => true do |t|
    t.integer "customer_id",    :null => false
    t.integer "reservation_id", :null => false
  end

  add_index "customers_reservations", ["customer_id", "reservation_id"], :name => "index_customers_reservations_on_customer_id_and_reservation_id", :unique => true

  create_table "receipts", :force => true do |t|
    t.date     "date_paid"
    t.string   "factura_num"
    t.string   "receipt_num"
    t.integer  "reservation_id"
    t.integer  "customer_id"
    t.integer  "company_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.decimal  "price"
    t.decimal  "discount"
  end

  create_table "reservations", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "customer_id"
    t.integer  "company_id"
    t.integer  "room_id"
    t.boolean  "paid",        :default => false
  end

  create_table "reservations_rooms", :id => false, :force => true do |t|
    t.integer "room_id",        :null => false
    t.integer "reservation_id", :null => false
  end

  add_index "reservations_rooms", ["reservation_id", "room_id"], :name => "index_reservations_rooms_on_reservation_id_and_room_id", :unique => true

  create_table "reservations_services", :id => false, :force => true do |t|
    t.integer "service_id",     :null => false
    t.integer "reservation_id", :null => false
  end

  add_index "reservations_services", ["reservation_id", "service_id"], :name => "index_reservations_services_on_reservation_id_and_service_id", :unique => true

  create_table "room_types", :force => true do |t|
    t.string   "name"
    t.integer  "spaces"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_types_rooms", :id => false, :force => true do |t|
    t.integer "room_id",      :null => false
    t.integer "room_type_id", :null => false
  end

  add_index "room_types_rooms", ["room_id", "room_type_id"], :name => "index_room_types_rooms_on_room_id_and_room_type_id", :unique => true

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "room_type_id"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
