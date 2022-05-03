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

ActiveRecord::Schema.define(version: 2022_05_03_032458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "schedules_id", null: false
    t.bigint "patients_id", null: false
    t.bigint "doctors_id", null: false
    t.integer "status"
    t.text "observations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctors_id"], name: "index_appointments_on_doctors_id"
    t.index ["patients_id"], name: "index_appointments_on_patients_id"
    t.index ["schedules_id"], name: "index_appointments_on_schedules_id"
  end

  create_table "consulting_rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "specialties_id", null: false
    t.string "loc_country"
    t.string "loc_region"
    t.string "loc_city"
    t.string "loc_commune"
    t.string "loc_nomeclature"
    t.string "loc_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["specialties_id"], name: "index_consulting_rooms_on_specialties_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.bigint "specialties_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "dni"
    t.integer "gender"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["specialties_id"], name: "index_doctors_on_specialties_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "dni"
    t.integer "gender"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "consulting_rooms_id", null: false
    t.date "date"
    t.time "time"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consulting_rooms_id"], name: "index_schedules_on_consulting_rooms_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "dni"
    t.integer "gender"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "doctors", column: "doctors_id"
  add_foreign_key "appointments", "patients", column: "patients_id"
  add_foreign_key "appointments", "schedules", column: "schedules_id"
  add_foreign_key "consulting_rooms", "specialties", column: "specialties_id"
  add_foreign_key "doctors", "specialties", column: "specialties_id"
  add_foreign_key "schedules", "consulting_rooms", column: "consulting_rooms_id"
end
