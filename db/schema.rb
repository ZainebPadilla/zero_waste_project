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

ActiveRecord::Schema[7.2].define(version: 2024_12_09_211800) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "production_raw_materials", force: :cascade do |t|
    t.bigint "production_id", null: false
    t.bigint "raw_material_id", null: false
    t.decimal "quantity_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "waste_generated"
    t.index ["production_id"], name: "index_production_raw_materials_on_production_id"
    t.index ["raw_material_id"], name: "index_production_raw_materials_on_raw_material_id"
  end

  create_table "productions", force: :cascade do |t|
    t.string "process_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_productions_on_user_id"
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string "name"
    t.decimal "co2_per_kg"
    t.decimal "waste_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "production_raw_materials", "productions"
  add_foreign_key "production_raw_materials", "raw_materials"
  add_foreign_key "productions", "users"
end
