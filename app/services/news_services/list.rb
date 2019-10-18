module NewsServices
  class List
    def self.call
      News.all.order_by_created_at_desc
    end
  end
end