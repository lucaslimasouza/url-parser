# frozen_string_literal: true

class PageParser
  def initialize(page)
    @page = Nokogiri::HTML(page)
  end

  def headers
    @page.css('h1', 'h2', 'h3').map(&:content).join(' ')
  end
end
