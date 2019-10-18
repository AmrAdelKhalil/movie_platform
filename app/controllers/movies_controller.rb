class MoviesController < ApplicationController
  def open_this_week
    @movies = MovieServices::WeeklyOpening.call
  end
end
