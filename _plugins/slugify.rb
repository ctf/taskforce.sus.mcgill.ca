module Jekyll
  module Filters
    def slugify(str)
      str.downcase.split.join("-").gsub(/[^a-zA-Z0-9-]/, '')
    end
  end
end
