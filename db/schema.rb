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

ActiveRecord::Schema.define(version: 20150821140214) do

  create_table "hashtags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "user_id"
    t.string   "msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets_hashtags", force: :cascade do |t|
    t.integer  "tweet_id"
    t.integer  "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tweets_hashtags", ["hashtag_id"], name: "index_tweets_hashtags_on_hashtag_id"
  add_index "tweets_hashtags", ["tweet_id"], name: "index_tweets_hashtags_on_tweet_id"

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "hashed_password"
    t.string "email"
  end

end
