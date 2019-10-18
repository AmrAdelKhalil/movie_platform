module MovieServices
  class ForGenre
    def self.call(genre_params)
      genre = Genre.find(genre_params[:genre_id])
      genre.movies
    end
  end
end