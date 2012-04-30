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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120325053658) do

  create_table "event_candidate_dates", :force => true do |t|
    t.integer  "event_id"
    t.date     "candidate_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_users", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "joins", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.date     "candidate_date"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "user_pass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
