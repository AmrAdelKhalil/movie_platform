module NewsServices
  class Filter
    def self.call(filters)
      begin
        generate_query(filters).distinct
      rescue
        []
      end
    end

    private

    def self.generate_query(filters)
      return [] if filters.blank?

      model = News
      filters.each {|key, value| model = model.send(key.to_sym, value) }
      model
    end
  end
end