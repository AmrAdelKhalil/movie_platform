module MovieServices
  class AddToWatchlist
    def self.call(user, watchlist_params)
      begin
        user.watchlist_ids << watchlist_params[:movie_id]
        true
      rescue
        false
      end
    end
  end
end