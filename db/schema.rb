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

ActiveRecord::Schema.define(version: 2019_10_19_134627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards_movies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "award_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_id"], name: "index_awards_movies_on_award_id"
    t.index ["movie_id"], name: "index_awards_movies_on_movie_id"
  end

  create_table "celebrities", force: :cascade do |t|
    t.string "name"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "celebrities_movies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "celebrity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["celebrity_id"], name: "index_celebrities_movies_on_celebrity_id"
    t.index ["movie_id"], name: "index_celebrities_movies_on_movie_id"
  end

  create_table "film_ratings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "film_ratings_movies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "film_rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_rating_id"], name: "index_film_ratings_movies_on_film_rating_id"
    t.index ["movie_id"], name: "index_film_ratings_movies_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genres_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genres_movies_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_users", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movies_users_on_movie_id"
    t.index ["user_id"], name: "index_movies_users_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rate", default: 0
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "awards_movies", "awards"
  add_foreign_key "awards_movies", "movies"
  add_foreign_key "celebrities_movies", "celebrities"
  add_foreign_key "celebrities_movies", "movies"
  add_foreign_key "film_ratings_movies", "film_ratings"
  add_foreign_key "film_ratings_movies", "movies"
  add_foreign_key "genres_movies", "genres"
  add_foreign_key "genres_movies", "movies"
  add_foreign_key "movies_users", "movies"
  add_foreign_key "movies_users", "users"
  add_foreign_key "ratings", "movies"
  add_foreign_key "ratings", "users"
end
