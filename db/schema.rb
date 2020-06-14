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

ActiveRecord::Schema.define(version: 2020_06_13_101815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "image_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "checklists", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "status", default: false
    t.bigint "patient_id"
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

  create_table "diets", force: :cascade do |t|
    t.text "description"
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_diets_on_patient_id"
  end

  create_table "help_addresses", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_help_addresses_on_patient_id"
  end

  create_table "histories", force: :cascade do |t|
    t.string "temperature"
    t.string "pressure"
    t.bigint "patient_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_histories_on_patient_id"
    t.index ["status_id"], name: "index_histories_on_status_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "sur_name"
    t.string "phone_number"
    t.datetime "birthday"
    t.string "address"
    t.string "sickness"
    t.integer "height"
    t.integer "weight"
    t.bigint "watcher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["watcher_id"], name: "index_patients_on_watcher_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_statuses_on_name", unique: true
  end

  create_table "useful_texts", force: :cascade do |t|
    t.text "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_useful_texts_on_category_id"
  end

  create_table "useful_videos", force: :cascade do |t|
    t.text "description"
    t.string "link"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_useful_videos_on_category_id"
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
  add_foreign_key "diets", "patients"
  add_foreign_key "help_addresses", "patients"
  add_foreign_key "histories", "patients"
  add_foreign_key "histories", "statuses"
  add_foreign_key "patients", "watchers"
  add_foreign_key "useful_texts", "categories"
  add_foreign_key "useful_videos", "categories"
end
