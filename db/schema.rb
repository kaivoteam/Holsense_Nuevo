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

ActiveRecord::Schema.define(version: 20171029234113) do

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "clock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content_file_name"
    t.string "content_content_type"
    t.integer "content_file_size"
    t.datetime "content_updated_at"
  end

  create_table "images_sections", id: false, force: :cascade do |t|
    t.integer "image_id", null: false
    t.integer "section_id", null: false
    t.index ["image_id", "section_id"], name: "index_images_sections_on_image_id_and_section_id"
    t.index ["section_id", "image_id"], name: "index_images_sections_on_section_id_and_image_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.text "comment"
    t.string "status"
    t.string "mail_requester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "section_id"
    t.integer "utp_role_id"
    t.integer "teacher_role_id"
    t.index ["section_id"], name: "index_requests_on_section_id"
    t.index ["teacher_role_id"], name: "index_requests_on_teacher_role_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
    t.index ["utp_role_id"], name: "index_requests_on_utp_role_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.text "description"
    t.integer "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
    t.integer "subject_id"
    t.index ["level_id"], name: "index_sections_on_level_id"
    t.index ["subject_id"], name: "index_sections_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "nickname", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "utp_role", default: false
    t.boolean "teacher_role", default: true
    t.integer "school_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

end
