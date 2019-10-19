class Award < ApplicationRecord
  has_and_belongs_to_many :movies, join_table: :awards_movies
end
