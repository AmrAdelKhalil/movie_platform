class Celebrity < ApplicationRecord
  has_and_belongs_to_many :movies, join_table: :celebrities_movies
end
