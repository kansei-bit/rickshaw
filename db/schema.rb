# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_25_115413) do

  create_table "receipts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_name", default: "", null: false
    t.integer "fee"
    t.boolean "cashless"
    t.integer "course_id"
    t.integer "adult_id"
    t.integer "child_id"
    t.boolean "group"
    t.string "departure_from", default: "", null: false
    t.string "arrive_at", default: "", null: false
    t.time "departure_time"
    t.time "arrival_time"
    t.string "overtime"
    t.string "course_time"
    t.bigint "shafu_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date", null: false
    t.index ["shafu_id"], name: "index_receipts_on_shafu_id"
  end

  create_table "shafus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "lname", default: "", null: false
    t.string "fname", default: "", null: false
    t.string "lname_katakana", default: "", null: false
    t.string "fname_katakana", default: "", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_shafus_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shafus_on_reset_password_token", unique: true
  end

  add_foreign_key "receipts", "shafus"
end
