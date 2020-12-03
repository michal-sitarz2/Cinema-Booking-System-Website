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

ActiveRecord::Schema.define(version: 2020_12_03_154656) do

  create_table "cinemas", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.string "director"
    t.string "genre", null: false
    t.integer "duration", null: false
    t.string "country"
    t.date "release_date", null: false
    t.string "poster", null: false
    t.text "summary", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "actors"
    t.string "video"
    t.string "restrictions"
    t.index ["title"], name: "index_movies_on_title", unique: true
  end

  create_table "screenings", force: :cascade do |t|
    t.decimal "price", null: false
    t.time "screening_time", null: false
    t.date "screening_date", null: false
    t.string "arena", null: false
    t.integer "available_seats", null: false
    t.string "cinema", null: false
    t.integer "sold_seats", default: 0
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "screening_type", default: "2D"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
  end

end
