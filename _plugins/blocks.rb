# For generating documentation with pretty icons that alternate between the
# left and right sides

module Jekyll
    class IconsTag < Liquid::Block
        def render(context)
            render = super
            sections_raw = find_sections(render)
            lines = render.split("\n")
            sections = sections_raw.map do |section_raw|
                section_title = {
                    :title => section_raw[4...-5],
                    :slug => real_slugify(section_raw[4...-5]),
                    :start => lines.index(section_raw)
                }
            end
            # Put in the end indices
            sections[-1][:end] = lines.length - 1
            sections[0..-2].reverse.each_index do |section|
                sections[section][:end] = sections[section+1][:start]
            end
            # Now go through them and put in the necessary divs and shit
            sections.each_slice(2) do |slice|
                lines[slice[0][:start]] = get_header(slice[0][:slug],slice[0][:title],get_icon_html(slice[0][:slug]))
                lines[slice[0][:end]-1] = get_tailer
                if slice[1]
                    lines[slice[1][:start]] = get_header(slice[1][:slug],slice[1][:title])
                    lines[slice[1][:end]-1] = get_tailer(get_icon_html(slice[1][:slug]))
                end
            end
            lines.join("\n")
        end

        def get_header(slug,title,icon = '')
            '<div class="row">' + icon + '<div class="span14"><h3 id="' + slug + '"><a href="#' + slug + '">' + title + '</a></h3>'
        end

        def get_tailer(icon = '')
            "</div>" + icon + "</div>"
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

    class HomepageTag < Liquid::Block
        def render(content)
            text = super
            @lines = text.split("\n")
            @sections_raw = text.scan(/<h2>[^<]+<\/h2>/)
            get_column_html(0) + get_column_html(1) + get_column_html(2) + '</div><br />' + '<div class="row">' + get_column_html(3)
        end

        def get_column_html(i)
            section_title = @sections_raw[i]
            end_index = i == 3 ? -1 : @lines.index(@sections_raw[i+1])-1
            section_content = @lines[@lines.index(@sections_raw[i])+1..end_index].join("\n")
            slug = real_slugify(section_title[4..-6])
            '<div class="span-one-third"><div class="center"><img src="img/' + slug + '.png" alt="' + slug + '" />' + section_title + '</div>' + section_content + '</div>'
        end
    end
end

Liquid::Template.register_tag('icons', Jekyll::IconsTag)
Liquid::Template.register_tag('homepage', Jekyll::HomepageTag)
