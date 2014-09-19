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

ActiveRecord::Schema.define(version: 20140916044917) do

  create_table "expenses", force: true do |t|
    t.string   "name"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "portfolio_id"
  end

  add_index "expenses", ["portfolio_id"], name: "index_expenses_on_portfolio_id"

  create_table "freedom_items", force: true do |t|
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "portfolio_id"
  end

  add_index "freedom_items", ["portfolio_id"], name: "index_freedom_items_on_portfolio_id"

  create_table "goals", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "image"
    t.decimal  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolios", force: true do |t|
    t.string   "name"
    t.decimal  "income"
    t.decimal  "expense_total"
    t.decimal  "savings_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wins", force: true do |t|
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "portfolio_id"
  end

  add_index "wins", ["portfolio_id"], name: "index_wins_on_portfolio_id"

end
