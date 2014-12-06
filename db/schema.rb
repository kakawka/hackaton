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

ActiveRecord::Schema.define(version: 20141206095114) do

  create_table "license_agreement_terms", force: true do |t|
    t.string   "code"
    t.text     "text"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "license_agreement_id"
  end

  add_index "license_agreement_terms", ["license_agreement_id"], name: "index_license_agreement_terms_on_license_agreement_id", using: :btree

  create_table "license_agreements", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "license_agreements", ["user_id"], name: "index_license_agreements_on_user_id", using: :btree

  create_table "term_acceptances", force: true do |t|
    t.integer  "visitor_id"
    t.integer  "license_agreement_term_id"
    t.boolean  "accepted"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "term_acceptances", ["license_agreement_term_id"], name: "index_term_acceptances_on_license_agreement_term_id", using: :btree
  add_index "term_acceptances", ["visitor_id"], name: "index_term_acceptances_on_visitor_id", using: :btree

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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visitors", force: true do |t|
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
