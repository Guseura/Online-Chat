# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_17_103631) do

  create_table "dialog_messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "dialog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dialog_id"], name: "index_dialog_messages_on_dialog_id"
    t.index ["user_id"], name: "index_dialog_messages_on_user_id"
  end

  create_table "dialogs", force: :cascade do |t|
    t.integer "dialog_first_user_id"
    t.integer "dialog_second_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "dialog_id"
    t.integer "user_id"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_messages", force: :cascade do |t|
    t.integer "dialog_id", null: false
    t.integer "users_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dialog_id"], name: "index_room_messages_on_dialog_id"
    t.index ["users_id"], name: "index_room_messages_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dialog_messages", "dialogs"
  add_foreign_key "dialog_messages", "users"
  add_foreign_key "room_messages", "dialogs"
  add_foreign_key "room_messages", "users", column: "users_id"
end
