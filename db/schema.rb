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

ActiveRecord::Schema.define(version: 20141004215155) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.integer  "zip"
    t.integer  "user_id"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts_have_products", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farmers", force: true do |t|
    t.text     "favorite_quotes"
    t.text     "role_models"
    t.text     "personal_philosophy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farms", force: true do |t|
    t.integer  "farmer_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_url"
    t.text     "delivery_options"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "farmer_id"
    t.integer  "customer_id"
    t.datetime "date"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.text     "description"
    t.string   "name"
    t.integer  "category"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_url"
    t.decimal  "price",              precision: 8, scale: 2
    t.decimal  "rating"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "quantity"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastname"
    t.string   "remember_token"
    t.string   "profile_type"
    t.integer  "profile_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
