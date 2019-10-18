class GenresController < ApplicationController
  def movies_with_genre
    @movies = MovieServices::ForGenre.call(genre_params)
    respond_to do |format|
      format.json { render json: @movies, status: :ok}
    end
  end

  private

  def genre_params
    params.permit(:genre_id)
  end
end
