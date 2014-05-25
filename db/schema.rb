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

ActiveRecord::Schema.define(version: 20140525111318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: true do |t|
    t.integer "project_id"
    t.string  "name"
    t.string  "slug"
    t.string  "actor"
    t.string  "subtitle_color"
  end

  create_table "inventory_combos", force: true do |t|
    t.integer "project_id"
    t.string  "name"
    t.string  "slug"
  end

  create_table "inventory_combos_items", id: false, force: true do |t|
    t.integer "inventory_combo_id"
    t.integer "inventory_item_id"
  end

  create_table "inventory_items", force: true do |t|
    t.integer "project_id"
    t.string  "name"
    t.string  "slug"
  end

  create_table "inventory_items_lists", id: false, force: true do |t|
    t.integer "inventory_item_id"
    t.integer "inventory_list_id"
  end

  create_table "inventory_lists", force: true do |t|
    t.integer "project_id"
    t.string  "name"
    t.string  "slug"
  end

  create_table "projects", force: true do |t|
    t.string "name"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "scenes", force: true do |t|
    t.string  "name"
    t.string  "slug"
    t.integer "project_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
