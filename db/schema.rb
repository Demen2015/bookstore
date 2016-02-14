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

ActiveRecord::Schema.define(version: 0) do

  create_table "lineitem", force: :cascade do |t|
    t.integer "productid", limit: 4
    t.integer "cart_id",   limit: 4
    t.float   "price",     limit: 53
    t.integer "quantity",  limit: 2
  end

  add_index "lineitem", ["cart_id"], name: "fk_shoppingcart_lineitem", using: :btree
  add_index "lineitem", ["productid"], name: "fk_product_lineitem", using: :btree

  create_table "payment", force: :cascade do |t|
    t.string   "typename",  limit: 50
    t.string   "CodeID",    limit: 50
    t.string   "cardname",  limit: 50
    t.datetime "cardvalid"
  end

  create_table "product", force: :cascade do |t|
    t.string  "isbn",          limit: 50,  null: false
    t.string  "title",         limit: 255, null: false
    t.string  "author",        limit: 50,  null: false
    t.string  "publisher",     limit: 255, null: false
    t.float   "price",         limit: 53
    t.float   "shippingprice", limit: 24
    t.integer "qty_in_stock",  limit: 2
  end

  create_table "shoppingcart", force: :cascade do |t|
    t.integer "user_id",        limit: 4
    t.integer "payment_id",     limit: 4
    t.float   "totalprice",     limit: 53
    t.integer "shippingmethod", limit: 2
  end

  add_index "shoppingcart", ["payment_id"], name: "fk_payment_shoppingcart", using: :btree
  add_index "shoppingcart", ["user_id"], name: "fk_user_shoppingcart", using: :btree

  create_table "user", force: :cascade do |t|
    t.string  "username", limit: 50
    t.string  "password", limit: 50
    t.string  "address",  limit: 255
    t.integer "tel",      limit: 2
  end

  add_foreign_key "lineitem", "product", column: "productid", name: "fk_product_lineitem"
  add_foreign_key "lineitem", "shoppingcart", column: "cart_id", name: "fk_shoppingcart_lineitem"
  add_foreign_key "shoppingcart", "payment", name: "fk_payment_shoppingcart"
  add_foreign_key "shoppingcart", "user", name: "fk_user_shoppingcart"
end
