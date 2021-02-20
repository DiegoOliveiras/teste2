# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_12_213606) do

  create_table "sales_reports_items", force: :cascade do |t|
    t.float "apn_code"
    t.float "rrp"
    t.float "last_buy_price"
    t.string "item_description"
    t.string "author"
    t.string "product_category"
    t.float "actual_stock_on_hand"
    t.date "trans_date"
    t.time "trans_time"
    t.string "trans_document"
    t.string "trans_reference"
    t.float "trans_quantity"
    t.float "trans_total_extax_value"
    t.float "trans_total_tax"
    t.float "trans_total_discount_given"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
  end

end
