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

    it 'includes a Page model when added' do
      Page.create(url: 'http://url-test.com', content: 'content')

      get '/pages'
      json = response.body

      expect(json).to have_json_path('data')
      expect(json).to have_json_size(1).at_path('data')
    end
  end

  describe 'POST #create' do
    before do
      expect_any_instance_of(Kernel).to receive_message_chain(:open, :read).and_return('page')
      expect_any_instance_of(PageParser).to receive(:headers).and_return('header')
    end

    it 'creates a new Page with content' do
      post_data = {
        data: {
          type: 'pages',
          attributes: {
            url: 'http://url-test.com'
          }
        }
      }.to_json

      post '/pages', params: post_data, headers: { 'Content-Type': 'application/vnd.api+json' }
      expect(response).to have_http_status(201)

      json = response.body

      expect(json).to have_json_path('data')
      expect(json).to have_json_size(4).at_path('data')
    end
  end
end
