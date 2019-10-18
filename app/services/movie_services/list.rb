module MovieServices
  class List
    def self.call()
      Movie.all
    end
  end
end