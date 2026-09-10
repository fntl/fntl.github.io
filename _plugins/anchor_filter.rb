# frozen_string_literal: true

# Adds an id anchor to every h2/h3/h4 heading in rendered HTML so the table of
# contents can deep-link into the page. Ids are slugified from the heading text.
module AnchorFilter
  def inject_anchors(input)
    return input if input.nil? || input.empty?

    input.gsub(/<(h[234])([^>]*)>(.*?)<\/\1>/im) do
      tag = ::Regexp.last_match(1)
      attrs = ::Regexp.last_match(2)
      body = ::Regexp.last_match(3)

      plain = body.gsub(/<[^>]*>/, '')
      id = plain.downcase.strip.gsub(/[^a-z0-9]+/, '-').gsub(/\A-+|-+\z/, '')
      id = 'section' if id.empty?

      "<#{tag}#{attrs} id=\"#{id}\">#{body}</#{tag}>"
    end
  end
end

Liquid::Template.register_filter(AnchorFilter)
