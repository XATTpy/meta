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

ActiveRecord::Schema.define(version: 2019_04_22_104507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "release"
    t.integer "score"
    t.index ["score"], name: "index_games_on_score"
    t.index ["title"], name: "index_games_on_title"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_genres_on_game_id", unique: true
    t.index ["genre"], name: "index_genres_on_genre"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "platform"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_platforms_on_game_id", unique: true
    t.index ["platform"], name: "index_platforms_on_platform"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "rating"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_ratings_on_game_id", unique: true
    t.index ["rating"], name: "index_ratings_on_rating"
  end

  create_table "summaries", force: :cascade do |t|
    t.text "summary"
    t.string "pic"
    t.string "developer"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_summaries_on_game_id", unique: true
  end

  add_foreign_key "genres", "games"
  add_foreign_key "platforms", "games"
  add_foreign_key "ratings", "games"
  add_foreign_key "summaries", "games"
end
