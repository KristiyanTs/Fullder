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

ActiveRecord::Schema.define(version: 20160802073015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.boolean  "age_restriction"
    t.boolean  "available_all_day"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "categories", ["restaurant_id"], name: "index_categories_on_restaurant_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.string   "choices"
    t.string   "demands"
    t.datetime "received_at"
    t.datetime "ready_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "product_size_id"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree
  add_index "order_items", ["product_size_id"], name: "index_order_items_on_product_size_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_status_id"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.decimal  "subtotal"
    t.decimal  "tax"
    t.decimal  "shipping"
    t.decimal  "tip"
    t.decimal  "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "table_id"
    t.integer  "table_number"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["restaurant_id"], name: "index_orders_on_restaurant_id", using: :btree
  add_index "orders", ["table_id"], name: "index_orders_on_table_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "permission_roles", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "permission_id"
    t.integer  "role_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "subject_class"
    t.string   "action"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "restaurant_id"
  end

  create_table "product_sizes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.decimal  "price"
    t.string   "short_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "product_sizes", ["product_id"], name: "index_product_sizes_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "category_id"
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.decimal  "price"
    t.boolean  "active"
    t.integer  "average_prepare_time"
    t.boolean  "ready"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["restaurant_id"], name: "index_products_on_restaurant_id", using: :btree

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
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "sells_online"
    t.string   "locale"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "roles", ["restaurant_id"], name: "index_roles_on_restaurant_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "number"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tables", ["restaurant_id"], name: "index_tables_on_restaurant_id", using: :btree
  add_index "tables", ["user_id"], name: "index_tables_on_user_id", using: :btree

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
    t.string   "locale"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "restaurants"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_sizes"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "tables"
  add_foreign_key "orders", "users"
  add_foreign_key "product_sizes", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "restaurants"
  add_foreign_key "roles", "restaurants"
  add_foreign_key "tables", "restaurants"
  add_foreign_key "tables", "users"
end
