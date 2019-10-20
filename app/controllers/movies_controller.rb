class MoviesController < ApplicationController

  before_action :set_movie, only: %i[show]

  def index
    @movies = MovieServices::List.call
    respond_to do |format|
      format.js
    end
  end

  def open_this_week
    @movies = MovieServices::WeeklyOpening.call
    respond_to do |format|
      format.js
    end
  end

  def search
    @movies = Movie.where(id: MovieServices::Filter.call(filter_params).map{|r| r['id']})
    respond_to do |format|
      format.js
    end
  end

  def rating_info
    respond_to do |format|
      format.json { render json: MovieServices::RatingInfo.call(params[:movie_id]), status: :ok }
    end
  end

  def watchlist_it
    response = MovieServices::AddToWatchlist.call(current_user, watchlist_params)
    respond_to do |format|
      format.json { render json: {success: response}, status: :ok }
    end
  end

  def add_review
    response = MovieServices::AddRate.call(current_user, rating_params)
    respond_to do |format|
      format.json { render json: response, status: :ok}
    end
  end

  def show
    @watchlisted = current_user.watchlist.include?(@movie)
  end

  private

  def filter_params
    params.permit(:by_movie_name, :by_celebrity_name)
  end

  def watchlist_params
    params.permit(:movie_id)
  end

  def rating_params
    params.permit(:movie_id, :rate)
  end

  def set_movie
    @movie = Movie.includes(:awards, :film_ratings, :celebrities).find(params[:id])
  end
end
