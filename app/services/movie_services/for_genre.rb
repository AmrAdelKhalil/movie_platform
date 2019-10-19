module MovieServices
  class ForGenre
    def self.call(genre_params)
      if genre_params[:genre_id].to_i.zero?
        MovieServices::List.call
      else
        Movie.joins(:genres).where(genres: {id: genre_params[:genre_id]})
      end
    end
  end
end