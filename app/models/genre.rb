class Genre < ApplicationRecord
  has_and_belongs_to_many :movies, join_table: :genres_movies
end
