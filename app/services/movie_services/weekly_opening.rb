module MovieServices
  class WeeklyOpening
    def self.call
      Movie.weekly_opening_movies
    end
  end
end