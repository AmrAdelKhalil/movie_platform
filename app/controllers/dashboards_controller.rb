class DashboardsController < ApplicationController
  def index
    @movies = MovieServices::List.call
    @genres = GenreServices::List.call
    @newses = NewsServices::List.call
  end
end
