class DashboardsController < ApplicationController
  def index
    @movies = MovieServices::List.call
  end
end
