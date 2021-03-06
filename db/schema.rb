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

ActiveRecord::Schema.define(version: 20191024144920) do

  create_table "app_release_platforms", force: :cascade do |t|
    t.integer "app_id", null: false
    t.integer "platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_release_platforms_on_app_id"
    t.index ["platform_id"], name: "index_app_release_platforms_on_platform_id"
  end

  create_table "apps", force: :cascade do |t|
    t.string "name", null: false
    t.string "app_type"
    t.string "version"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_apps_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number_employee"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_items", force: :cascade do |t|
    t.integer "used_times", default: 0
    t.float "price"
    t.integer "app_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_purchase_items_on_app_id"
    t.index ["user_id"], name: "index_purchase_items_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "app_id", null: false
    t.integer "star"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_reviews_on_app_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "country"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
