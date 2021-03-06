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

ActiveRecord::Schema.define(version: 20140501192100) do

  create_table "answer_topics", force: true do |t|
    t.integer  "answer_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_topics", ["answer_id"], name: "index_answer_topics_on_answer_id"
  add_index "answer_topics", ["topic_id"], name: "index_answer_topics_on_topic_id"

  create_table "answer_votes", force: true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_votes", ["answer_id"], name: "index_answer_votes_on_answer_id"
  add_index "answer_votes", ["user_id"], name: "index_answer_votes_on_user_id"

  create_table "answers", force: true do |t|
    t.text     "body"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "rank"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "follows", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["question_id"], name: "index_follows_on_question_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "question_topics", force: true do |t|
    t.integer  "question_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_topics", ["question_id", "topic_id"], name: "index_question_topics_on_question_id_and_topic_id"

  create_table "question_votes", force: true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_votes", ["question_id"], name: "index_question_votes_on_question_id"
  add_index "question_votes", ["user_id"], name: "index_question_votes_on_user_id"

  create_table "questions", force: true do |t|
    t.string   "title"
    t.boolean  "answered",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "body"
    t.float    "rank"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "topics", force: true do |t|
    t.string   "title"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "avatar"
    t.boolean  "email_follows",          default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
