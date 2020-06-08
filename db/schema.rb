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

ActiveRecord::Schema.define(version: 2020_06_08_140206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "checklists", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "status", default: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_checklists_on_patient_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_contacts_on_patient_id"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "watcher_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_histories_on_patient_id"
    t.index ["status_id"], name: "index_histories_on_status_id"
    t.index ["watcher_id"], name: "index_histories_on_watcher_id"
  end

  create_table "patient_sicknesses", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "sickness_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id", "sickness_id"], name: "index_patient_sicknesses_on_patient_id_and_sickness_id", unique: true
    t.index ["patient_id"], name: "index_patient_sicknesses_on_patient_id"
    t.index ["sickness_id"], name: "index_patient_sicknesses_on_sickness_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "sur_name"
    t.string "phone_number", null: false
    t.bigint "status_id", null: false
    t.bigint "watcher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.index ["status_id"], name: "index_patients_on_status_id"
    t.index ["watcher_id"], name: "index_patients_on_watcher_id"
  end

  create_table "sicknesses", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_sicknesses_on_name", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_statuses_on_name", unique: true
  end

  create_table "watchers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "sur_name"
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_watchers_on_email", unique: true
  end

  add_foreign_key "checklists", "patients"
  add_foreign_key "contacts", "patients"
  add_foreign_key "histories", "patients"
  add_foreign_key "histories", "statuses"
  add_foreign_key "histories", "watchers"
  add_foreign_key "patient_sicknesses", "patients"
  add_foreign_key "patient_sicknesses", "sicknesses"
  add_foreign_key "patients", "statuses"
  add_foreign_key "patients", "watchers"
end
