module MovieServices
  class AddRate
    def self.call(user, rating_params)
      Rating.create(user_id: user.id, movie_id: rating_params[:movie_id], rate: rating_params[:rate])
      MovieServices::RatingInfo.call(rating_params[:movie_id])
    end
  end
end