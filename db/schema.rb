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

ActiveRecord::Schema.define(version: 2020_12_11_181815) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "movie_title", null: false
    t.date "booked_date", null: false
    t.string "booked_time", null: false
    t.integer "quantity", null: false
    t.string "cinema", null: false
    t.string "arena", null: false
    t.decimal "total_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "screening_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["screening_id"], name: "index_line_items_on_screening_id"
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
    t.string "video", null: false
    t.string "restrictions", default: "N/A"
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
