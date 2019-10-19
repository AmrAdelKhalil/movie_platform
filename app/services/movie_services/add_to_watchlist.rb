module MovieServices
  class AddToWatchlist
    def self.call(user, watchlist_params)
      begin
        movie = Movie.find(watchlist_params[:movie_id])
        if movie
          user.watchlist.delete(movie)
          user.watchlist << movie
        end
        true
      rescue
        false
      end
    end
  end
end