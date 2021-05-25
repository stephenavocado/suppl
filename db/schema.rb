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

ActiveRecord::Schema.define(version: 2021_05_25_182146) do

  create_table "elements", force: :cascade do |t|
    t.integer "room_id"
    t.string "name"
    t.integer "saves_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "materials_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "photo_ref"
    t.integer "manufacturer_id"
    t.string "name"
    t.string "residential_use"
    t.string "commercial_use"
    t.string "materials"
    t.string "price_range"
    t.string "description"
    t.string "indoor_outdoor"
    t.string "application"
    t.string "manufacturer_note"
    t.string "flammability"
    t.string "hardness"
    t.string "availability"
    t.string "lead_time"
    t.string "min_units"
    t.string "country_of_origin"
    t.string "content"
    t.string "finish"
    t.string "construction"
    t.string "wood_grade"
    t.string "wood_figuring"
    t.integer "saves_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "palettes", force: :cascade do |t|
    t.integer "material_id"
    t.integer "user_id"
    t.integer "name"
    t.string "description"
    t.integer "saves_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "palette_name"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.integer "user_id"
    t.string "description"
    t.string "photo"
    t.integer "spaces_count"
    t.integer "invitations_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "project_id"
    t.string "description"
    t.integer "elements_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "comments_count"
    t.integer "projects_count"
    t.integer "invitations_sent_count"
    t.integer "invitation_requests_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
