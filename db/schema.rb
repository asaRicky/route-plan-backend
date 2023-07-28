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

ActiveRecord::Schema[7.0].define(version: 2023_07_28_111649) do
  create_table "check_ins", force: :cascade do |t|
    t.integer "merchandiser_id", null: false
    t.integer "outlet_id", null: false
    t.datetime "check_in_timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["merchandiser_id"], name: "index_check_ins_on_merchandiser_id"
    t.index ["outlet_id"], name: "index_check_ins_on_outlet_id"
    t.index ["user_id"], name: "index_check_ins_on_user_id"
  end

  create_table "merchandisers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_merchandisers_on_user_id"
  end

  create_table "outlets", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_plans", force: :cascade do |t|
    t.integer "merchandiser_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["merchandiser_id"], name: "index_route_plans_on_merchandiser_id"
    t.index ["user_id"], name: "index_route_plans_on_user_id"
  end

  create_table "sales_managers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sales_managers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "check_ins", "merchandisers"
  add_foreign_key "check_ins", "outlets"
  add_foreign_key "check_ins", "users"
  add_foreign_key "merchandisers", "users"
  add_foreign_key "route_plans", "merchandisers"
  add_foreign_key "route_plans", "users"
  add_foreign_key "sales_managers", "users"
end
