module MovieServices
  class AddRate
    def self.call(user, rating_params)
      rate = Rating.where(user_id: user.id, movie_id: rating_params[:movie_id]).first
      if rate.nil?
        Rating.create(user_id: user.id, movie_id: rating_params[:movie_id], rate: rating_params[:rate])
      else
        rate.update(rate: rating_params[:rate])
      end
      MovieServices::RatingInfo.call(rating_params[:movie_id])
    end
  end
end