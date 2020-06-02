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

ActiveRecord::Schema.define(version: 2020_06_02_180409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "position"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "sur_name"
    t.string "phone_number", null: false
    t.bigint "status_id", null: false
    t.bigint "street_id", null: false
    t.bigint "watcher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_patients_on_status_id"
    t.index ["street_id"], name: "index_patients_on_street_id"
    t.index ["watcher_id"], name: "index_patients_on_watcher_id"
  end

  create_table "sicknesses", force: :cascade do |t|
    t.string "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "street_buildings", force: :cascade do |t|
    t.bigint "street_id", null: false
    t.bigint "building_id", null: false
    t.index ["building_id"], name: "index_street_buildings_on_building_id"
    t.index ["street_id", "building_id"], name: "index_street_buildings_on_street_id_and_building_id", unique: true
    t.index ["street_id"], name: "index_street_buildings_on_street_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "name"
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
  end

  add_foreign_key "patients", "statuses"
  add_foreign_key "patients", "streets"
  add_foreign_key "patients", "watchers"
  add_foreign_key "street_buildings", "buildings"
  add_foreign_key "street_buildings", "streets"
end
