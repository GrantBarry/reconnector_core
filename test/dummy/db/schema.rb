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

ActiveRecord::Schema[7.1].define(version: 2024_05_31_124400) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "core_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "company_name"
    t.string "legal_name"
    t.string "email"
    t.string "phone"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "core_agents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "core_account_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.string "phone"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["core_account_id"], name: "index_core_agents_on_core_account_id"
  end

  create_table "core_properties", force: :cascade do |t|
    t.string "type"
    t.uuid "core_agent_id", null: false
    t.string "internal_id"
    t.string "name"
    t.string "building"
    t.string "estate"
    t.string "floor_level"
    t.string "floor"
    t.string "unit_suite_shop"
    t.string "local_council"
    t.string "land_area_description"
    t.string "hard_stand_yard_description"
    t.string "headline"
    t.string "grabline"
    t.string "keywords"
    t.integer "parking_spaces"
    t.string "parking_commentslifts_escalators_travelators"
    t.string "clear_span_columns"
    t.string "lot_number"
    t.string "crane"
    t.string "entrances_roller_doors_container_access"
    t.string "zoning"
    t.string "disability_access"
    t.string "rating"
    t.decimal "office_area", precision: 10, scale: 2
    t.decimal "warehouse_area", precision: 10, scale: 2
    t.decimal "showroom_area", precision: 10, scale: 2
    t.decimal "storage_area", precision: 10, scale: 2
    t.decimal "production_area", precision: 10, scale: 2
    t.decimal "trading_area", precision: 10, scale: 2
    t.decimal "floor_area", precision: 10, scale: 2
    t.decimal "land_area", precision: 10, scale: 2
    t.decimal "hard_stand_yard_area", precision: 10, scale: 2
    t.decimal "min_clearance_height", precision: 10, scale: 2
    t.decimal "max_clearance_height", precision: 10, scale: 2
    t.decimal "calculated_building_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["core_agent_id"], name: "index_core_properties_on_core_agent_id"
  end

  create_table "core_website_domains", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "core_website_id", null: false
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["core_website_id"], name: "index_core_website_domains_on_core_website_id"
  end

  create_table "core_websites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "core_account_id", null: false
    t.string "description"
    t.string "title"
    t.string "keywords"
    t.string "enquiry_phone"
    t.string "enquiry_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["core_account_id"], name: "index_core_websites_on_core_account_id"
  end

  add_foreign_key "core_agents", "core_accounts"
  add_foreign_key "core_properties", "core_agents"
  add_foreign_key "core_website_domains", "core_websites"
  add_foreign_key "core_websites", "core_accounts"
end
