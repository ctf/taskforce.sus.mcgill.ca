# For generating documentation with pretty icons that alternate between the
# left and right sides
require '_plugins/slugify'

module Jekyll
  class TestTag < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      sections_raw = find_sections(super)
      lines = super.split("\n")
      sections = []
      for section_raw in sections_raw
        section_title = section_raw[4...-5]
        slug = real_slugify(section_title)
        start_index = lines.index(section_raw)
        sections.push({:title => section_title, :slug => slug, :start => start_index})
      end
      # Put in the end indices
      last_start = lines.length - 1
      for section in sections.reverse
        section[:end] = last_start
        last_start = section[:start]
      end
      # Now go through them and put in the necessary divs and shit
      left = true
      sections.each{|section|
        if left
          left_stuff = get_icon_html(section[:slug])
          right_stuff = ''
         else
           left_stuff = ''
           right_stuff = get_icon_html(section[:slug])
         end
        lines[section[:start]] = '<div class="row">' + left_stuff + '<div class="span14"><h3 id="' + section[:slug] + '">' + section[:title] + ' <small><a href="#' + section[:slug] + '">#</a></small></h3>'
        lines[section[:end]-1] = "</div>" + right_stuff + "</div>"
        left = !left
      }
      lines.join("\n")
    end

    def get_icon_html(slug)
      if slug == ''
        ''
      else
        "<div class=\"span2 center\"><img src=\"img/#{slug}.png\" class=\"thumb\" alt=\"#{slug}\" /></div>"
      end
    end

    def find_sections(text)
      text.scan(/<h2>[^<]+<\/h2>/)
    end
  end
end

Liquid::Template.register_tag('icons', Jekyll::TestTag)
