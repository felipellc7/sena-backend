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

ActiveRecord::Schema.define(version: 2022_05_03_233043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.integer "status", default: 0
    t.text "observations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["schedule_id"], name: "index_appointments_on_schedule_id"
  end

  create_table "consulting_rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "specialty_id", null: false
    t.string "loc_country"
    t.string "loc_region"
    t.string "loc_city"
    t.string "loc_commune"
    t.string "loc_address"
    t.string "loc_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["specialty_id"], name: "index_consulting_rooms_on_specialty_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.bigint "specialty_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "dni"
    t.integer "gender"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "doctor"
    t.index ["specialty_id"], name: "index_doctors_on_specialty_id"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.text "diagnosis"
    t.text "treatment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_histories_on_appointment_id"
    t.index ["doctor_id"], name: "index_histories_on_doctor_id"
    t.index ["patient_id"], name: "index_histories_on_patient_id"
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
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "patient"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "consulting_room_id", null: false
    t.date "date"
    t.time "time"
    t.boolean "available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consulting_room_id"], name: "index_schedules_on_consulting_room_id"
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
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "admin"
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "schedules"
  add_foreign_key "consulting_rooms", "specialties"
  add_foreign_key "doctors", "specialties"
  add_foreign_key "histories", "appointments"
  add_foreign_key "histories", "doctors"
  add_foreign_key "histories", "patients"
  add_foreign_key "schedules", "consulting_rooms"
end
