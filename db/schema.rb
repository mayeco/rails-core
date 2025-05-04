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

ActiveRecord::Schema[8.0].define(version: 2025_05_02_220251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "car_brands", force: :cascade do |t|
    t.string "brand_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_classes", force: :cascade do |t|
    t.string "brand_id"
    t.string "class_id"
    t.string "name"
    t.bigint "car_brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_brand_id"], name: "index_car_classes_on_car_brand_id"
  end

  create_table "car_models", force: :cascade do |t|
    t.string "brand_id"
    t.string "class_id"
    t.string "model_id"
    t.string "name"
    t.string "opr_model_id"
    t.bigint "car_class_id"
    t.bigint "car_brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_requests", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "brand_id"
    t.string "class_id"
    t.string "contact_person_email"
    t.string "contact_person_name"
    t.string "contact_person_phone"
    t.text "description"
    t.integer "hours_estimated"
    t.string "location"
    t.string "model_id"
    t.integer "model_year"
    t.string "name"
    t.datetime "osm_arrival_date"
    t.datetime "osm_arrival_time"
    t.string "osm_campaign"
    t.string "osm_campaign_code"
    t.string "osm_color"
    t.string "osm_engine_number"
    t.string "osm_external_ref_id"
    t.string "osm_name_arrival"
    t.string "osm_name_order"
    t.datetime "osm_order_date"
    t.datetime "osm_order_time"
    t.string "osmru_t_lcl"
    t.decimal "osm_reference_amount_iva"
    t.string "osm_special_spare"
    t.string "osm_stock"
    t.string "registration_number"
    t.string "replacement_device"
    t.string "request_id"
    t.string "resource_group"
    t.string "resource_personal_number"
    t.integer "service_region"
    t.string "source_id"
    t.string "status"
    t.decimal "usage_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_groups", force: :cascade do |t|
    t.string "dataAreaId"
    t.string "groupId"
    t.string "inputWarehouseId"
    t.string "groupName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groupId"], name: "index_resource_groups_on_groupId", unique: true
  end

  create_table "resources", force: :cascade do |t|
    t.string "dataAreaId"
    t.string "resourceId"
    t.string "resourceWorkerPersonnelNumber"
    t.string "resourceName"
    t.string "resourceGroup"
    t.bigint "resource_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resourceId"], name: "index_resources_on_resourceId", unique: true
    t.index ["resource_group_id"], name: "index_resources_on_resource_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.jsonb "omniauth_providers", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "car_classes", "car_brands"
  add_foreign_key "car_models", "car_brands"
  add_foreign_key "car_models", "car_classes"
  add_foreign_key "resources", "resource_groups"
end
