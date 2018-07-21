# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageParser do
  let(:page) do
    '<h1>Title 1</h1></br>
    <h2>Title 2</h2></br>
    <h3>Title 3</h3><br>
    <h4>Title 4</h4>'
  end

  describe '#headers' do
    subject do
      PageParser.new(
        page
      )
    end

    it 'return contents of headers' do
      expect(subject.headers).to eq('Title 1 Title 2 Title 3')
    end
  end
end
