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

ActiveRecord::Schema.define(version: 20160617200855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.decimal  "bill",          precision: 10, scale: 2
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "table_number"
  end

  add_index "carts", ["restaurant_id"], name: "index_carts_on_restaurant_id", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.integer  "menu_id"
    t.boolean  "age_restriction"
    t.boolean  "available_all_day"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "working_hour_id"
    t.string   "name"
    t.string   "category_avatar_file_name"
    t.string   "category_avatar_content_type"
    t.integer  "category_avatar_file_size"
    t.datetime "category_avatar_updated_at"
  end

  add_index "categories", ["menu_id"], name: "index_categories_on_menu_id", using: :btree
  add_index "categories", ["working_hour_id"], name: "index_categories_on_working_hour_id", using: :btree

  create_table "meal_sizes", force: :cascade do |t|
    t.text     "description"
    t.string   "name"
    t.decimal  "price"
    t.integer  "meal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "meal_sizes", ["meal_id"], name: "index_meal_sizes_on_meal_id", using: :btree

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "category_id"
    t.string   "meal_avatar_file_name"
    t.string   "meal_avatar_content_type"
    t.integer  "meal_avatar_file_size"
    t.datetime "meal_avatar_updated_at"
    t.integer  "restaurant_id"
    t.integer  "menu_id"
    t.string   "short_description"
  end

  add_index "meals", ["category_id"], name: "index_meals_on_category_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.boolean  "active"
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "meal_id"
    t.integer  "quantity"
    t.string   "specifications"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id", using: :btree
  add_index "orders", ["meal_id"], name: "index_orders_on_meal_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.string   "role"
    t.text     "description"
    t.boolean  "create_meal"
    t.boolean  "edit_menu"
    t.boolean  "create_position"
    t.boolean  "edit_position"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "positions", ["restaurant_id"], name: "index_positions_on_restaurant_id", using: :btree
  add_index "positions", ["user_id"], name: "index_positions_on_user_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.datetime "from"
    t.datetime "to"
    t.integer  "table_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reservations", ["table_id"], name: "index_reservations_on_table_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.string   "phone_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "restaurant_avatar_file_name"
    t.string   "restaurant_avatar_content_type"
    t.integer  "restaurant_avatar_file_size"
    t.datetime "restaurant_avatar_updated_at"
  end

  create_table "supplementals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "meal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "supplementals", ["meal_id"], name: "index_supplementals_on_meal_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "number"
    t.integer  "capacity"
    t.text     "description"
    t.boolean  "available"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tables", ["restaurant_id"], name: "index_tables_on_restaurant_id", using: :btree

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "working_hours", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.datetime "starting_hour"
    t.datetime "ending_hour"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "working_hours", ["restaurant_id"], name: "index_working_hours_on_restaurant_id", using: :btree

  add_foreign_key "carts", "restaurants"
  add_foreign_key "carts", "users"
  add_foreign_key "categories", "menus"
  add_foreign_key "meal_sizes", "meals"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "meals"
  add_foreign_key "positions", "restaurants"
  add_foreign_key "positions", "users"
  add_foreign_key "reservations", "tables"
  add_foreign_key "reservations", "users"
  add_foreign_key "supplementals", "meals"
  add_foreign_key "tables", "restaurants"
  add_foreign_key "working_hours", "restaurants"
end
