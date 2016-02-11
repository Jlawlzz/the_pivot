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

ActiveRecord::Schema.define(version: 20160210195951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.integer  "winning_bid",     default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "status",          default: "live"
    t.integer  "human_id"
    t.integer  "business_id"
    t.integer  "user_id"
    t.integer  "winning_bid_id"
    t.datetime "expiration_date"
  end

  add_index "auctions", ["business_id"], name: "index_auctions_on_business_id", using: :btree
  add_index "auctions", ["human_id"], name: "index_auctions_on_human_id", using: :btree
  add_index "auctions", ["user_id"], name: "index_auctions_on_user_id", using: :btree
  add_index "auctions", ["winning_bid_id"], name: "index_auctions_on_winning_bid_id", using: :btree

  create_table "bids", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "business_id"
    t.integer  "auction_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "bids", ["auction_id"], name: "index_bids_on_auction_id", using: :btree
  add_index "bids", ["business_id"], name: "index_bids_on_business_id", using: :btree
  add_index "bids", ["user_id"], name: "index_bids_on_user_id", using: :btree

  create_table "business_users", force: :cascade do |t|
    t.integer "business_id"
    t.integer "user_id"
  end

  add_index "business_users", ["business_id"], name: "index_business_users_on_business_id", using: :btree
  add_index "business_users", ["user_id"], name: "index_business_users_on_user_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "description"
    t.string   "url"
    t.string   "status",      default: "pending"
  end

  create_table "humans", force: :cascade do |t|
    t.string   "scum_name"
    t.string   "bio"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.string   "url",        default: "https://www.ssa.gov/history/pics/woman50.gif"
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.string   "image_url",   default: "bill_cosby.gif"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "travesty_id"
    t.boolean  "active",      default: true
  end

  add_index "items", ["travesty_id"], name: "index_items_on_travesty_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "item_quantity"
    t.integer  "item_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "total_price"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "stars",      default: 1
  end

  add_index "reviews", ["item_id"], name: "index_reviews_on_item_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travesties", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "slug"
    t.string   "sponsor_image"
    t.string   "sponsor_title"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_roles", ["business_id"], name: "index_user_roles_on_business_id", using: :btree
  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "username"
    t.string   "last_name"
    t.integer  "role",            default: 0
  end

  create_table "winning_bids", force: :cascade do |t|
    t.integer  "bid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "winning_bids", ["bid_id"], name: "index_winning_bids_on_bid_id", using: :btree

  add_foreign_key "auctions", "businesses"
  add_foreign_key "auctions", "humans"
  add_foreign_key "auctions", "users"
  add_foreign_key "auctions", "winning_bids"
  add_foreign_key "bids", "auctions"
  add_foreign_key "bids", "businesses"
  add_foreign_key "bids", "users"
  add_foreign_key "business_users", "businesses"
  add_foreign_key "business_users", "users"
  add_foreign_key "items", "travesties"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "items"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_roles", "businesses"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "winning_bids", "bids"
end
