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

ActiveRecord::Schema.define(version: 2020_10_13_201415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "UserKlass", force: :cascade do |t|
    t.bigint "klasses_id"
    t.bigint "users_id"
    t.boolean "reminder"
    t.index ["klasses_id"], name: "index_UserKlass_on_klasses_id"
    t.index ["users_id"], name: "index_UserKlass_on_users_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string "name"
    t.string "instructor"
    t.string "scheduled_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id"
    t.integer "class_id"
    t.boolean "reminder"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.string "skill_level"
    t.boolean "instructor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "UserKlass", "klasses", column: "klasses_id"
  add_foreign_key "UserKlass", "users", column: "users_id"
end
