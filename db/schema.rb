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

ActiveRecord::Schema.define(version: 20160704191554) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patents", force: :cascade do |t|
    t.string   "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.text     "payment_method"
    t.text     "bank"
    t.text     "credit_card_number"
    t.integer  "credit_card_key"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "start_at"
    t.datetime "ends_at"
    t.integer  "patent_id"
    t.float    "amount"
    t.integer  "payment_id"
  end

  add_index "reservations", ["patent_id"], name: "index_reservations_on_patent_id"
  add_index "reservations", ["payment_id"], name: "index_reservations_on_payment_id"
  add_index "reservations", ["spot_id"], name: "index_reservations_on_spot_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "spots", force: :cascade do |t|
    t.integer  "number"
    t.integer  "area_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "state",      default: "Libre"
  end

  add_index "spots", ["area_id"], name: "index_spots_on_area_id"

  create_table "user_patents", force: :cascade do |t|
    t.boolean  "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "patent_id"
  end

  add_index "user_patents", ["patent_id"], name: "index_user_patents_on_patent_id"
  add_index "user_patents", ["user_id"], name: "index_user_patents_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "viewers", force: :cascade do |t|
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
