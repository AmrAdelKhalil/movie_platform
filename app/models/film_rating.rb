class FilmRating < ApplicationRecord
  has_and_belongs_to_many :movies, join_table: :film_ratings_movies
end
