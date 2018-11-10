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

ActiveRecord::Schema.define(version: 2018_11_10_225533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "designatable_type"
    t.integer "designatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "image"
    t.string "start_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deckings", force: :cascade do |t|
    t.string "game_id"
    t.integer "card_id"
    t.integer "participation_id"
    t.boolean "classified"
    t.integer "show_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "start_game"
    t.integer "current_character"
    t.boolean "complete"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "character_id"
    t.string "current_location"
    t.integer "current_location_x"
    t.integer "current_location_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "location_x"
    t.integer "location_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sheet_infos", force: :cascade do |t|
    t.integer "card_id"
    t.integer "participation_id"
    t.integer "guess"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
