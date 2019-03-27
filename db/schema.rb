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

ActiveRecord::Schema.define(version: 20190326233904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "event_title"
    t.date     "event_start_date"
    t.decimal  "event_cost_mcpla"
    t.string   "event_location"
    t.string   "event_start_time"
    t.integer  "user_id"
    t.string   "blue_golf_link"
    t.date     "registration_close"
    t.date     "event_end_date"
    t.decimal  "event_cost_non_mcpla"
    t.decimal  "event_cost_season_pass"
    t.boolean  "is_partner_event",       default: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "minutes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "pdf_file"
    t.integer  "user_id"
    t.date     "date"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "note_update"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "partners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.integer  "event_id"
    t.index ["event_id"], name: "index_partners_on_event_id", using: :btree
    t.index ["user_id"], name: "index_partners_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "flight_winner"
    t.string   "winners_image"
    t.string   "which_flight"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "event_id"
    t.integer  "winning_score"
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.index ["event_id"], name: "index_registrations_on_event_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_registrations_on_user_id_and_event_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "team_schedule_info"
    t.integer  "user_id"
  end

  create_table "teetimes", force: :cascade do |t|
    t.string   "teetime_pdf"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.date     "date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "subscribed",             default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "home_club"
    t.string   "membership_status"
    t.string   "partner"
    t.integer  "partner_id"
    t.boolean  "isTreasurer"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["partner_id"], name: "index_users_on_partner_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
