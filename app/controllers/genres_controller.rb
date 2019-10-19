class GenresController < ApplicationController
  def movies_with_genre
    @movies = MovieServices::ForGenre.call(genre_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def genre_params
    params.permit(:genre_id)
  end
end
