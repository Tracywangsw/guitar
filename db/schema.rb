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

ActiveRecord::Schema.define(version: 20160103133357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string   "name"
    t.string   "purchase_url"
    t.integer  "cover_image_id"
    t.integer  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "description"
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "file"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "column_tags", force: :cascade do |t|
    t.integer  "column_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "column_tags", ["tag_id", "column_id"], name: "index_column_tags_on_tag_id_and_column_id", unique: true, using: :btree

  create_table "columns", force: :cascade do |t|
    t.string   "name"
    t.string   "video_url"
    t.string   "description"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "category"
    t.integer  "cover_image_id"
    t.integer  "image_ids",      default: [],                 array: true
    t.boolean  "is_recommend",   default: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "commenter_id"
    t.string   "commenter_type"
    t.boolean  "is_blocked",     default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "comments", ["commenter_type", "commenter_id"], name: "index_comments_on_commenter_type_and_commenter_id", using: :btree

  create_table "course_tags", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_tags", ["tag_id", "course_id"], name: "index_course_tags_on_tag_id_and_course_id", unique: true, using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "video_url"
    t.integer  "level"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "audio_id"
    t.integer  "cover_image_id"
    t.string   "description"
    t.boolean  "is_recommend",   default: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.boolean  "has_been_read", default: false
    t.integer  "type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "photo_shows", force: :cascade do |t|
    t.string   "description"
    t.integer  "image_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "scores", force: :cascade do |t|
    t.string   "name"
    t.integer  "image_ids",   default: [],              array: true
    t.string   "description"
    t.integer  "course_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "scores", ["course_id"], name: "index_scores_on_course_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "cover_image_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "is_admin",        default: false
    t.boolean  "is_frozen",       default: false
    t.integer  "admin_type"
    t.integer  "course_collects", default: [],                 array: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "score_collects",  default: [],                 array: true
  end

end
