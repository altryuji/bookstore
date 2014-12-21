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

ActiveRecord::Schema.define(version: 20141221070741) do

  create_table "authors", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title",      null: false
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree

  create_table "shop_books", force: true do |t|
    t.integer  "shop_id",                null: false
    t.integer  "book_id",                null: false
    t.integer  "quantity",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shop_books", ["book_id"], name: "index_shop_books_on_book_id", using: :btree
  add_index "shop_books", ["shop_id"], name: "index_shop_books_on_shop_id", using: :btree

  create_table "shops", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["name"], name: "index_shops_on_name", unique: true, using: :btree

end
