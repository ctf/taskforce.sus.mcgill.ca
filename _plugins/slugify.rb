# Err can't figure out how to call it from docs.rb otherwise
def real_slugify(str)
  str.downcase.gsub(/ /, '-').gsub(/[^a-zA-Z0-9-]/, '')
end

module Jekyll
  module Filters
    def slugify(str)
      real_slugify(str)
    end
  end
end
