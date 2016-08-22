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

ActiveRecord::Schema.define(version: 20160820083628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "supercategory_id"
    t.string   "name"
    t.boolean  "age_restriction"
    t.boolean  "available_all_day"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.index ["restaurant_id"], name: "index_categories_on_restaurant_id", using: :btree
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
    t.index ["supercategory_id"], name: "index_categories_on_supercategory_id", using: :btree
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.index ["category_id"], name: "index_category_translations_on_category_id", using: :btree
    t.index ["locale"], name: "index_category_translations_on_locale", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "group_translations", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["group_id"], name: "index_group_translations_on_group_id", using: :btree
    t.index ["locale"], name: "index_group_translations_on_locale", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "maximum"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_groups_on_product_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.index ["restaurant_id"], name: "index_images_on_restaurant_id", using: :btree
  end

  create_table "option_translations", force: :cascade do |t|
    t.integer  "option_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["locale"], name: "index_option_translations_on_locale", using: :btree
    t.index ["option_id"], name: "index_option_translations_on_option_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_options_on_group_id", using: :btree
  end

  create_table "options_order_items", force: :cascade do |t|
    t.integer  "option_id"
    t.integer  "order_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["option_id"], name: "index_options_order_items_on_option_id", using: :btree
    t.index ["order_item_id"], name: "index_options_order_items_on_order_item_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "size_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.string   "demands"
    t.datetime "received_at"
    t.datetime "ready_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
    t.index ["size_id"], name: "index_order_items_on_size_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_status_id"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "table_id"
    t.decimal  "subtotal"
    t.decimal  "tax"
    t.decimal  "shipping"
    t.decimal  "tip"
    t.decimal  "total"
    t.integer  "table_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id", using: :btree
    t.index ["table_id"], name: "index_orders_on_table_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "permission_roles", force: :cascade do |t|
    t.integer  "permission_id"
    t.integer  "role_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["permission_id"], name: "index_permission_roles_on_permission_id", using: :btree
    t.index ["restaurant_id"], name: "index_permission_roles_on_restaurant_id", using: :btree
    t.index ["role_id"], name: "index_permission_roles_on_role_id", using: :btree
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
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_positions_on_restaurant_id", using: :btree
    t.index ["role_id"], name: "index_positions_on_role_id", using: :btree
    t.index ["user_id"], name: "index_positions_on_user_id", using: :btree
  end

  create_table "product_translations", force: :cascade do |t|
    t.integer  "product_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.index ["locale"], name: "index_product_translations_on_locale", using: :btree
    t.index ["product_id"], name: "index_product_translations_on_product_id", using: :btree
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["restaurant_id"], name: "index_products_on_restaurant_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.integer  "table_id"
    t.datetime "from_time"
    t.time     "duration"
    t.string   "contact_number"
    t.string   "contact_name"
    t.integer  "seats"
    t.string   "requirements"
    t.boolean  "confirmed",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id", using: :btree
    t.index ["table_id"], name: "index_reservations_on_table_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "restaurant_translations", force: :cascade do |t|
    t.integer  "restaurant_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
    t.index ["locale"], name: "index_restaurant_translations_on_locale", using: :btree
    t.index ["restaurant_id"], name: "index_restaurant_translations_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.string   "phone_number"
    t.string   "country",                        default: "en-GB"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "sells_online"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "restaurant_avatar_file_name"
    t.string   "restaurant_avatar_content_type"
    t.integer  "restaurant_avatar_file_size"
    t.datetime "restaurant_avatar_updated_at"
    t.string   "slug"
    t.index ["slug"], name: "index_restaurants_on_slug", unique: true, using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_roles_on_restaurant_id", using: :btree
  end

  create_table "size_translations", force: :cascade do |t|
    t.integer  "size_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
    t.index ["locale"], name: "index_size_translations_on_locale", using: :btree
    t.index ["size_id"], name: "index_size_translations_on_size_id", using: :btree
  end

  create_table "sizes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.decimal  "price"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_sizes_on_product_id", using: :btree
  end

  create_table "tables", force: :cascade do |t|
    t.integer  "number"
    t.integer  "capacity"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_tables_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_tables_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "locale",                 default: "en"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "working_times", force: :cascade do |t|
    t.time     "from_time"
    t.time     "to_time"
    t.integer  "from_day"
    t.integer  "to_day"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_working_times_on_restaurant_id", using: :btree
  end

  add_foreign_key "categories", "restaurants"
  add_foreign_key "favorites", "restaurants"
  add_foreign_key "favorites", "users"
  add_foreign_key "groups", "products"
  add_foreign_key "images", "restaurants"
  add_foreign_key "options", "groups"
  add_foreign_key "options_order_items", "options"
  add_foreign_key "options_order_items", "order_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "sizes"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "tables"
  add_foreign_key "orders", "users"
  add_foreign_key "permission_roles", "permissions"
  add_foreign_key "permission_roles", "restaurants"
  add_foreign_key "permission_roles", "roles"
  add_foreign_key "positions", "restaurants"
  add_foreign_key "positions", "roles"
  add_foreign_key "positions", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "restaurants"
  add_foreign_key "reservations", "restaurants"
  add_foreign_key "reservations", "tables"
  add_foreign_key "reservations", "users"
  add_foreign_key "roles", "restaurants"
  add_foreign_key "sizes", "products"
  add_foreign_key "tables", "restaurants"
  add_foreign_key "tables", "users"
  add_foreign_key "working_times", "restaurants"
end
