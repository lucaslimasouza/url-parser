# frozen_string_literal: true

class PageResource < JSONAPI::Resource
  attributes :url, :content
end
