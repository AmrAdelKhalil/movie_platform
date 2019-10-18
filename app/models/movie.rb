class Movie < ApplicationRecord

  scope :weekly_opening_movies, -> () { where(release_date: Date.today.beginning_of_week..Date.today.end_of_week)}
end
