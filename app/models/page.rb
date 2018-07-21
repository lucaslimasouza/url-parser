# frozen_string_literal: true

class Page < ApplicationRecord
  validates :url, :content, presence: true
end
