class Movie < ApplicationRecord

  has_and_belongs_to_many :genres, join_table: :genres_movies

  scope :weekly_opening_movies, -> () { where(release_date: Date.today.beginning_of_week..Date.today.end_of_week)}
end
