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

ActiveRecord::Schema.define(version: 20160205163550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breaches", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_rule_id"
    t.integer  "application_id"
    t.text     "pk_values"
    t.integer  "business_object_id"
    t.integer  "record_id"
    t.integer  "period_id"
    t.integer  "organisation_id"
    t.integer  "territory_id"
    t.string   "name"
    t.text     "description"
    t.integer  "breach_type_id"
    t.integer  "breach_status_id"
    t.string   "message_source"
    t.string   "object_name"
    t.text     "error_message"
    t.text     "current_values"
    t.text     "proposed_values"
    t.boolean  "is_whitelisted"
    t.date     "opened_at"
    t.date     "expected_at"
    t.date     "closed_at"
    t.integer  "responsible_id"
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "record_updated_by"
    t.datetime "record_updated_at"
    t.integer  "owner_id"
    t.boolean  "is_identified"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.integer  "notification_id"
  end

  create_table "business_areas", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "pcf_index"
    t.string   "pcf_reference"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  add_index "business_areas", ["code"], name: "index_business_areas_on_code", unique: true, using: :btree
  add_index "business_areas", ["name"], name: "index_business_areas_on_name", unique: true, using: :btree

  create_table "business_flows", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_area_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "pcf_index"
    t.string   "pcf_reference"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "business_objects", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "name"
    t.text     "description"
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.string   "hierarchy"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "business_area_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.integer  "main_scope_id"
    t.string   "code",               limit: 255
  end

  create_table "business_processes", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "business_flow_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "pcf_index"
    t.string   "pcf_reference"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "business_rules", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "business_value"
    t.string   "hierarchy"
    t.integer  "status_id"
    t.integer  "owner_id"
    t.text     "check_description"
    t.text     "check_script"
    t.text     "correction_method"
    t.text     "correction_script"
    t.string   "correction_batch"
    t.text     "white_list"
    t.text     "condition"
    t.decimal  "added_value"
    t.decimal  "maintenance_cost"
    t.decimal  "maintenance_duration"
    t.string   "version"
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.integer  "business_process_id"
    t.integer  "business_object_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "rule_type_id"
    t.integer  "severity_id"
    t.integer  "complexity_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string   "name",               limit: 100,                 null: false
    t.text     "description"
    t.string   "type",               limit: 20,                  null: false
    t.integer  "size",                                           null: false
    t.boolean  "is_key",                         default: false, null: false
    t.string   "created_by",         limit: 100,                 null: false
    t.string   "updated_by",         limit: 100,                 null: false
    t.string   "session_id",         limit: 100,                 null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "business_object_id"
    t.integer  "playground_id"
    t.boolean  "is_published"
    t.integer  "precision"
  end

  create_table "data_policies", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "landscape_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.text     "organisations_list"
    t.text     "territories_list"
    t.text     "business_rules_list"
    t.text     "date_limitations"
    t.text     "policy_matrix"
    t.string   "status_id"
    t.string   "owner_id"
    t.datetime "active_from"
    t.datetime "active_to"
    t.integer  "scope_id"
    t.integer  "business_process_id"
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "data_processes", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "name"
    t.text     "description"
    t.integer  "scope_id"
    t.integer  "business_object_id"
    t.integer  "status_id"
    t.datetime "last_run_at"
    t.datetime "next_run_at"
    t.datetime "last_run_end"
    t.decimal  "duration"
    t.integer  "loaded"
    t.integer  "inserted"
    t.integer  "updated"
    t.integer  "deleted"
    t.integer  "rejected"
    t.integer  "owner_id"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "landscapes", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "mappings", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "mappings_list_id"
    t.string   "source_software"
    t.string   "source_table"
    t.string   "source_value_id"
    t.string   "source_code"
    t.string   "target_software"
    t.string   "target_table"
    t.string   "target_value_id"
    t.string   "target_code"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_caption"
    t.string   "target_caption"
    t.integer  "owner_id"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "mappings_lists", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "owner_id"
    t.integer  "source_list_id"
    t.integer  "target_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "name"
    t.text     "description"
    t.integer  "severity_id"
    t.integer  "status_id"
    t.integer  "scope_id"
    t.integer  "business_object_id"
    t.datetime "expected_at"
    t.datetime "closed_at"
    t.integer  "responsible_id"
    t.integer  "owner_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organisations", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "organisation_level"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "parent_id"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.string   "external_reference"
  end

  create_table "parameters", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "name"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_list"
    t.string   "param_value"
    t.integer  "parameters_list_id"
    t.string   "param_code"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.integer  "owner_id"
  end

  add_index "parameters", ["name"], name: "index_parameters_on_name", using: :btree

  create_table "parameters_lists", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "owner_id"
    t.boolean  "is_user_specific"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "playgrounds", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "code"
    t.string   "role"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "scopes", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "landscape_id"
    t.string   "code"
    t.string   "name"
    t.string   "load_interface"
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.integer  "business_object_id"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "all_records"
    t.integer  "bad_records"
    t.decimal  "score"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.string   "db_technology",      limit: 30
    t.string   "db_connection",      limit: 200
    t.string   "db_owner_schema",    limit: 30
    t.string   "structure_name",     limit: 50
    t.text     "description"
    t.text     "sql_query"
  end

  create_table "sequences", force: :cascade do |t|
    t.integer "playground_id"
    t.string  "class_name"
    t.integer "current_id"
  end

  create_table "territories", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "territory_level"
    t.string   "hierarchy"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "status_id"
    t.integer  "owner_id"
    t.integer  "parent_id"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
    t.string   "external_reference"
  end

  create_table "time_scales", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "day_number"
    t.integer  "day_of_week"
    t.integer  "day_of_month"
    t.integer  "day_of_year"
    t.integer  "week_number"
    t.integer  "week_of_month"
    t.integer  "week_of_year"
    t.integer  "month_number"
    t.integer  "month_of_year"
    t.integer  "quarter_number"
    t.integer  "quarter"
    t.integer  "semester_number"
    t.integer  "semester"
    t.integer  "year_number"
    t.integer  "year"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_accesses", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.integer  "territory_id"
    t.integer  "business_area_id"
    t.integer  "business_flow_id"
    t.integer  "business_process_id"
    t.integer  "business_object_id"
    t.text     "description"
    t.integer  "organisation_level"
    t.integer  "territory_level"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "user_id"
    t.string   "role_id"
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "default_playground_id"
    t.integer  "current_playground_id"
    t.integer  "current_landscape_id"
    t.string   "directory_id"
    t.string   "login"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_to"
    t.boolean  "is_admin"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "name"
    t.string   "language"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "values", force: :cascade do |t|
    t.integer  "playground_id"
    t.integer  "values_list_id"
    t.string   "name"
    t.text     "description"
    t.string   "value_code"
    t.string   "value_caption"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

  create_table "values_lists", force: :cascade do |t|
    t.integer  "playground_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "created_by"
    t.string   "updated_by"
    t.integer  "owner_id"
    t.string   "table_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
    t.string   "software_name"
    t.integer  "odq_unique_id"
    t.integer  "odq_object_id"
  end

end
