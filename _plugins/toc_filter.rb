# frozen_string_literal: true

# Extracts every h2/h3 heading from rendered HTML and emits a nested <ol> table
# of contents. Call with `{{ content | toc_only }}` before the `inject_anchors`
# pass so the ids line up exactly.
module TocFilter
  def toc_only(input)
    return '' if input.nil? || input.empty?

    # [level, id, text]
    headings = input.scan(/<h([234])([^>]*)>(.*?)<\/h\1>/im).map do |level, attrs, body|
      plain = body.gsub(/<[^>]*>/, '')
      id = plain.downcase.strip.gsub(/[^a-z0-9]+/, '-').gsub(/\A-+|-+\z/, '')
      id = 'section' if id.empty?
      [level.to_i, id, plain]
    end

    return '' if headings.empty?

    out = +"<ol class=\"toc-list\">\n"
    current = 2
    headings.each do |level, id, text|
      while current < level
        out << "<ol>\n"
        current += 1
      end
      while current > level
        out << "</ol>\n"
        current -= 1
      end
      out << "<li><a href=\"##{id}\">#{text}</a></li>\n"
    end
    while current > 2
      out << "</ol>\n"
      current -= 1
    end
    out << "</ol>\n"
    out
  end
end

Liquid::Template.register_filter(TocFilter)
