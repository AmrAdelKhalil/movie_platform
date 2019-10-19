class Movie < ApplicationRecord

  has_many :ratings
  has_many :rated_by, through: :ratings, source: :user

  has_and_belongs_to_many :awards, join_table: :awards_movies
  has_and_belongs_to_many :genres, join_table: :genres_movies
  has_and_belongs_to_many :celebrities, join_table: :celebrities_movies
  has_and_belongs_to_many :film_ratings, join_table: :film_ratings_movies
  has_and_belongs_to_many :watchlisted_by, join_table: :movies_users, class_name: 'User'

  scope :weekly_opening_movies, -> () { where(release_date: Date.today.beginning_of_week..Date.today.end_of_week)}

  mount_uploader :image, PosterUploader
end
