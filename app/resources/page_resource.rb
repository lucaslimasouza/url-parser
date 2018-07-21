# frozen_string_literal: true

require 'open-uri'

class PageResource < JSONAPI::Resource
  attributes :url, :content

  def save
    parser = PageParser.new(open(url))
    @model.content = parser.headers + parser.links
    super
  end
end
