module GenreServices
  class List
    def self.call
      Genre.all
    end
  end
end