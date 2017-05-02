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

ActiveRecord::Schema.define(version: 20170501225947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instrument_types", force: :cascade do |t|
    t.string "instrument_type", null: false
  end

  create_table "ukulele_shapes", force: :cascade do |t|
    t.string "ukulele_shape", null: false
  end

  create_table "ukulele_sizes", force: :cascade do |t|
    t.string "ukulele_size", null: false
  end

  create_table "ukuleles", force: :cascade do |t|
    t.string   "instrument_type",    null: false
    t.string   "ukulele_shape"
    t.string   "ukulele_size"
    t.string   "luthier"
    t.string   "model"
    t.integer  "serial_number"
    t.date     "purchase_date"
    t.string   "body_top"
    t.string   "body_sides"
    t.string   "body_back"
    t.string   "body_neck"
    t.string   "body_fretboard"
    t.string   "body_binding"
    t.string   "tuner_type"
    t.string   "tuner_manufacture"
    t.string   "string_manufacture"
    t.integer  "string_count"
    t.string   "string_tuning"
    t.string   "finish_type"
    t.string   "finish_look"
    t.string   "pickup"
    t.string   "nut_material"
    t.string   "saddle_material"
    t.integer  "neck_width"
    t.integer  "length_scale"
    t.integer  "length_body"
    t.integer  "width"
    t.integer  "depth"
    t.integer  "users_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["users_id"], name: "index_ukuleles_on_users_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
