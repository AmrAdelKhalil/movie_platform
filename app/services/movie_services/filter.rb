module MovieServices
  class Filter
    def self.call(filters)
      by_celebrity_name = Movie.joins(:celebrities).where('celebrities.name LIKE ?', "%#{filters[:by_celebrity_name]}%").to_sql
      by_movie_name = Movie.where('name LIKE ?', "%#{filters[:by_movie_name]}%").to_sql
      ActiveRecord::Base.connection.execute("#{by_celebrity_name} UNION #{by_movie_name}")
    end
  end
end