module MovieServices
  class RatingInfo
    def self.call(movie_id)
      return {} if movie_id.nil?

      ratings = Rating.where(movie_id: movie_id).group(:rate).count
      score_sum = ratings.map{|score, num_of_raters| score * num_of_raters}.reduce(:+)
      raters = ratings.values.reduce(:+)
      total = (1.0 * score_sum) / (raters * Rating::RATE_SCALE)
      {
        score: total,
        number_of_raters: raters,
        percentage: total * 100
      }
    end
  end
end