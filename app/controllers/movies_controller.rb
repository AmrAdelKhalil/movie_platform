class MoviesController < ApplicationController
  def open_this_week
    @movies = MovieServices::WeeklyOpening.call
  end

  def search
    @movies = MovieServices::Filter.call(filter_params)
    respond_to do |format|
      format.json { render json: @news, status: :ok }
    end
  end

  private

  def filter_params
    params.permit(:by_movie_name, :by_celebrity_name)
  end
end
