# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageParser do
  let(:page) do
    "<h1>Title 1</h1></br>
    <h2>Title 2</h2></br>
    <h3>Title 3</h3><br>
    <h4>Title 4</h4>
    <a href='http://url.com'> Link 1</a>
    <a href='http://url-test.com'> Link 2</a>"
  end

  subject do
    PageParser.new(
      page
    )
  end

  describe '#headers' do
    it 'return contents from headers' do
      expect(subject.headers).to eq('Title 1 Title 2 Title 3')
    end
  end

  describe '#links' do
    it 'return urls from links' do
      expect(subject.links).to eq('http://url.com http://url-test.com')
    end
  end
end
