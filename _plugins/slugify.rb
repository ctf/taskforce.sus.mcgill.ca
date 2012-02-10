module Jekyll
  module Filters
    def slugify(str)
      str.downcase.gsub(/ /, '-').gsub(/[^a-zA-Z0-9-]/, '')
    end
  end
end
