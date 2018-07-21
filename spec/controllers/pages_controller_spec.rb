# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :request do
  describe 'GET #index' do
    it 'has correct status and content type' do
      get '/pages'
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/vnd.api+json')
    end

    it 'has empty body array by default' do
      get '/pages'
      json = response.body
      expect(json).to have_json_path('data')
      expect(json).to have_json_size(0).at_path('data')
    end

    it 'includes a schedule model when added' do
      Page.create(url: 'http://url-test.com', content: 'content')
      get '/pages'
      json = response.body
      expect(json).to have_json_path('data')
      expect(json).to have_json_size(1).at_path('data')
    end
  end
end
