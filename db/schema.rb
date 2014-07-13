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

ActiveRecord::Schema.define(version: 20140713201911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movements", force: true do |t|
    t.string "name", null: false
  end

  add_index "movements", ["name"], name: "index_movements_on_name", unique: true, using: :btree

  create_table "personal_records", force: true do |t|
    t.integer "user_id",        null: false
    t.integer "back_squat"
    t.integer "front_squat"
    t.integer "overhead_squat"
    t.integer "clean"
    t.integer "snatch"
    t.integer "power_clean"
    t.integer "power_snatch"
    t.integer "hang_clean"
    t.integer "hang_snatch"
    t.integer "split_jerk"
    t.integer "push_jerk"
    t.integer "push_press"
    t.integer "press"
    t.integer "dead_lift"
  end

  create_table "programs", force: true do |t|
    t.string "name", null: false
  end

  add_index "programs", ["name"], name: "index_programs_on_name", unique: true, using: :btree

  create_table "statistics", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "workout_id",  null: false
    t.integer  "performance", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id",                          null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wods", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id",  null: false
  end

  create_table "workout_types", force: true do |t|
    t.string "name", null: false
  end

  add_index "workout_types", ["name"], name: "index_workout_types_on_name", unique: true, using: :btree

  create_table "workouts", force: true do |t|
    t.text     "description",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workout_type_id", null: false
    t.integer  "wod_id",          null: false
    t.string   "name",            null: false
    t.integer  "movement"
    t.integer  "workout_id"
  end

end
