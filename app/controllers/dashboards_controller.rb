class DashboardsController < ApplicationController
  def index
    @movies = MovieServices::List.call
    binding.pry
  end
end
