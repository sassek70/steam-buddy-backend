# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_04_011509) do
  create_table "games", force: :cascade do |t|
    t.string "game_name"
    t.integer "steam_game_id"
  end

  create_table "group_games", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_game_id"
    t.integer "game_added_by_user"
    t.date "date_added"
  end

# Could not dump table "groups" because of following StandardError
#   Unknown type 'bool' for column 'is_public'

  create_table "user_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer "group_id"
    t.integer "group_member_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'bool' for column 'is_online'

end
